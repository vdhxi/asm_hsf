package hsf.project.service.Implement;

import hsf.project.enums.RentalStatus;
import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.pojo.CarRental;
import hsf.project.repository.CarProducerRepository;
import hsf.project.repository.CarRentalRepository;
import hsf.project.repository.CarRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CarServiceImpl {
    CarRepository carRepository;
    CarProducerRepository carProducerRepository;
    CarRentalRepository carRentalRepository;
    SupabaseService supabaseService;

    public Car findCarById(int id) {
        return carRepository.findById(id);
    }

    public List<Car> getAllCars() {
        return carRepository.findAll();
    }

    @Transactional
    //Most important list for to operate filter
    public List<Car> getAllCarsAvailableBetween(LocalDate from, LocalDate to) {
        List<CarRental> carPickupList = new ArrayList<>(carRentalRepository.findByPickupDateBetween(from, to));
        List<CarRental> carReturnList = new ArrayList<>(carRentalRepository.findByReturnDateBetween(from, to));
        Set<CarRental> carRentals = new HashSet<>(carPickupList);
        carRentals.addAll(carReturnList);
        List<CarRental> carRentalList = new ArrayList<>(carRentals);
        List<Car> carList = new ArrayList<>(carRepository.findAll());
        List<Car> carsRented = new ArrayList<>();
        if (!carRentalList.isEmpty()) {
            for (CarRental carRental : carRentalList) {
                if (!carRental.getPickupDate().isAfter(LocalDate.now())) {
                    carRental.setStatus(RentalStatus.RENTING);
                    carRental.getCar().setRented(true);
                    carRentalRepository.save(carRental);
                    carRepository.save(carRental.getCar());
                }
                if (carRental.getReturnDate().isBefore(LocalDate.now())) {
                    carRental.setStatus(RentalStatus.COMPLETED);
                    carRental.getCar().setRented(false);
                    carRentalRepository.save(carRental);
                    carRepository.save(carRental.getCar());
                }
                if (carRental.getStatus() != RentalStatus.COMPLETED) {
                    carsRented.add(carRental.getCar());
                }
            }
        }
        carList.removeAll(carsRented);
        carList.retainAll(getAllCarsAvailable());
        return carList;
    }

    public List<Car> getAllCarsByBrand(int id, List<Car> carList) {
        List<Car> carsAllow = new ArrayList<>();
        if (!carList.isEmpty()) {
            for (Car car : carList) {
                if (car.getProducer().getId() == id) {
                    carsAllow.add(car);
                }
            }
        }
        return carsAllow;
    }

    public List<Car> getAllCarsByCapacity(List<Car> carList, int min, int max) {
        List<Car> carsAllow = new ArrayList<>();
        if (!carList.isEmpty()) {
            for (Car car : carList) {
                if (car.getCapacity() >= min && car.getCapacity() <= max) {
                    carsAllow.add(car);
                }
            }
        }
        return carsAllow;
    }

    public List<Car> getAllCarsByPrice(List<Car> carList, int min, int max) {
        List<Car> carsAllow = new ArrayList<>();
        if (!carList.isEmpty()) {
            for (Car car : carList) {
                if (car.getRentPrice() >= min && car.getRentPrice() <= max) {
                    carsAllow.add(car);
                }
            }
        }
        return carsAllow;
    }

    public List<Car> sortByPriceAscending(List<Car> carList) {
        if (!carList.isEmpty()) {
            Collections.sort(carList, Comparator.comparingInt(Car::getRentPrice));
        }
        return carList;
    }

    public List<Car> sortByPriceDescending(List<Car> carList) {
        if (!carList.isEmpty()) {
            Collections.sort(carList, Comparator.comparingInt(Car::getRentPrice).reversed());
        }
        return carList;
    }

    public List<Car> getAllCarsRented() {
        return carRepository.findByIsRentedTrue();
    }

    public List<Car> getAllCarsAvailable() {
        return carRepository.findByIsRentedFalse();
    }

    @Transactional
    public void createCar(String name, int year, String color, int capacity, String description, int price, int producerId, MultipartFile image) {
        try {
            CarProducer carProducer = carProducerRepository.findById(producerId).orElse(null);
            LocalDate importDate = LocalDate.now();
            Car car = Car.builder()
                    .carName(name)
                    .carModelYear(year)
                    .color(color)
                    .capacity(capacity)
                    .description(description)
                    .importDate(importDate)
                    .rentPrice(price)
                    .isRented(false)
                    .build();
            if (carProducer != null) {
                car.setProducer(carProducer);
            }
            carRepository.save(car);
            if (image != null) {
                supabaseService.upload(image,"Car_"+car.getId());
                String url = supabaseService.getImage("Car_"+car.getId());
                car.setUrl(url);
            }
            carRepository.save(car);
        } catch (IOException e) {
            System.err.println("Failed to save : " + e.getMessage());
        }

    }

    @Transactional
    public void updateCar(int id, String name, int year, String color, int capacity, String description, int price, int producerId, boolean rented, MultipartFile image) {
        try {
            CarProducer carProducer = carProducerRepository.findById(producerId).orElse(null);
            Car car = carRepository.findById(id);
            if (car != null) {
                if (!name.isEmpty()) car.setCarName(name);
                if (year != car.getCarModelYear()) car.setCarModelYear(year);
                if (!color.isEmpty()) car.setColor(color);
                if (capacity != car.getCapacity()) car.setCapacity(capacity);
                if (!description.isEmpty()) car.setDescription(description);
                if (price != car.getRentPrice()) car.setRentPrice(price);
                car.setRented(rented);
                if (carProducer != null) {
                    car.setProducer(carProducer);
                }
                if (image != null) {
                    supabaseService.delete("Car_"+id);
                    supabaseService.upload(image,"Car_"+id);
                    String url = supabaseService.getImage("Car_"+id);
                    car.setUrl(url);
                }
                carRepository.save(car);
            }
        } catch (IOException e) {
            System.err.println("Failed to update : " + e.getMessage());
        }
    }

    @Transactional
    public void deleteCar(int id) {
        try {
            Car car = carRepository.findById(id);
            if (car != null) {
                supabaseService.delete("Car_"+id);
                carRepository.delete(car);
            }
        } catch (IOException e) {
            System.err.println("Failed to delete : " + e.getMessage());
        }
    }

    public int countTotalCars() {
        return carRepository.findAll().size();
    }

    public int countRentedCars() {
        return carRepository.findByIsRentedTrue().size();
    }

    public int countUnRentedCars() {
        return countTotalCars() - countRentedCars();
    }

}
