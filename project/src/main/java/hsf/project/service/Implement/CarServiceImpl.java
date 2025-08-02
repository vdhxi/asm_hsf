package hsf.project.service.Implement;

import hsf.project.enums.RentalStatus;
import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.pojo.CarRental;
import hsf.project.repository.CarProducerRepository;
import hsf.project.repository.CarRentalRepository;
import hsf.project.repository.CarRepository;
import hsf.project.service.CarService;
import hsf.project.service.SupabaseService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CarServiceImpl implements CarService {
    CarRepository carRepository;
    CarProducerRepository carProducerRepository;
    CarRentalRepository carRentalRepository;
    SupabaseService supabaseService;

    public Car findCarById(int id) {
        return carRepository.findById(id);
    }

    public List<Car> getAllCars() {
        List<Car> carList = carRepository.findAllByIsActiveTrue();
        LocalDate from = LocalDate.now();
        LocalDate to = LocalDate.now();
        List<RentalStatus> status = List.of(RentalStatus.CANCELLED, RentalStatus.COMPLETED);
        for (Car car : carList) {
            /*List<CarRental> condition1 = carRentalRepository.findByCarAndPickupDateBetweenAndStatusNotIn(car, from, to, status);
            List<CarRental> condition2 = carRentalRepository.findByCarAndReturnDateBetweenAndStatusNotIn(car, from, to, status);
            List<CarRental> condition3 = carRentalRepository.findByCarAndPickupDateAfterAndReturnDateBeforeAndStatusNotIn(car, from, to, status);
            List<CarRental> condition4 = carRentalRepository.findByCarAndPickupDateBeforeAndReturnDateAfterAndStatusNotIn(car, from, to, status);
            if (condition1.isEmpty() && condition2.isEmpty() && condition3.isEmpty() && condition4.isEmpty()) {
                car.setRented(false);
                carRepository.save(car);
            }*/
            if (checkCarAvailable(car, from, to, status)) {
                car.setRented(false);
                carRepository.save(car);
            }

        }
        return carList;
    }

    public List<Car> getAllCarsAvailableBetween(LocalDate from, LocalDate to) {
        List<Car> carList = carRepository.findAllByIsActiveTrue();
        List<Car> carAvailableList = new ArrayList<>();
        List<RentalStatus> status = List.of(RentalStatus.CANCELLED, RentalStatus.COMPLETED);
        for (Car car : carList) {
            /*List<CarRental> condition1 = carRentalRepository.findByCarAndPickupDateBetweenAndStatusNotIn(car, from, to, status);
            List<CarRental> condition2 = carRentalRepository.findByCarAndReturnDateBetweenAndStatusNotIn(car, from, to, status);
            List<CarRental> condition3 = carRentalRepository.findByCarAndPickupDateAfterAndReturnDateBeforeAndStatusNotIn(car, from, to, status);
            List<CarRental> condition4 = carRentalRepository.findByCarAndPickupDateBeforeAndReturnDateAfterAndStatusNotIn(car, from, to, status);
            if (condition1.isEmpty() && condition2.isEmpty() && condition3.isEmpty() && condition4.isEmpty()) {
                carAvailableList.add(car);
            }*/
            if (checkCarAvailable(car, from, to, status)) {
                carAvailableList.add(car);
            }
        }
        return carAvailableList;
    }

    //If car have the rental in condition => not  available
    private boolean checkCarAvailable(Car car, LocalDate from, LocalDate to, List<RentalStatus> status) {
        List<CarRental> condition1 = carRentalRepository.findByCarAndPickupDateBetweenAndStatusNotIn(car, from, to, status);
        List<CarRental> condition2 = carRentalRepository.findByCarAndReturnDateBetweenAndStatusNotIn(car, from, to, status);
        List<CarRental> condition3 = carRentalRepository.findByCarAndPickupDateAfterAndReturnDateBeforeAndStatusNotIn(car, from, to, status);
        List<CarRental> condition4 = carRentalRepository.findByCarAndPickupDateBeforeAndReturnDateAfterAndStatusNotIn(car, from, to, status);
        return condition1.isEmpty() && condition2.isEmpty() && condition3.isEmpty() && condition4.isEmpty();
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
            carList.sort(Comparator.comparingInt(Car::getRentPrice));
        }
        return carList;
    }

    public List<Car> sortByPriceDescending(List<Car> carList) {
        if (!carList.isEmpty()) {
            carList.sort(Comparator.comparingInt(Car::getRentPrice).reversed());
        }
        return carList;
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
                    .isActive(true)
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
        Car car = carRepository.findById(id);
        if (!car.getCarRentalList().isEmpty()) {
            car.setActive(false);
            carRepository.save(car);
        } else {
            try {
                supabaseService.delete("Car_"+id);
                carRepository.delete(car);
            } catch (IOException e) {
                System.err.println("Failed to delete : " + e.getMessage());
            }
        }
    }

    public int countTotalCars() {
        return carRepository.findAllByIsActiveTrue().size();
    }

    public int countRentedCars() {
        return carRepository.findByIsRentedTrueAndIsActiveTrue().size();
    }

    public int countUnRentedCars() {
        return countTotalCars() - countRentedCars();
    }

}
