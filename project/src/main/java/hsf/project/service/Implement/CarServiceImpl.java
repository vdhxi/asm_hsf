package hsf.project.service.Implement;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.repository.CarProducerRepository;
import hsf.project.repository.CarRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CarServiceImpl {
    CarRepository carRepository;
    CarProducerRepository carProducerRepository;
    SupabaseService supabaseService;

    public Car findCarById(int id) {
        return carRepository.findById(id);
    }

    public List<Car> findAllCars() {
        return carRepository.findAll();
    }

    public List<Car> findCarsByBrand(String brand) {
        CarProducer carProducer = carProducerRepository.findCarProducerByProducerName(brand);
        return carRepository.findByProducer(carProducer);
    }

    public List<Car> findCarsByColor(String color) {
        return carRepository.findByColor(color);
    }

    public List<Car> findCarsByCapacity(int min, int max) {
        return carRepository.findByCapacityBetween(min, max);
    }

    public List<Car> findCarsByModelYear(int min, int max) {
        return carRepository.findByCarModelYearBetween(min, max);
    }

    public List<Car> findAllCarsRented() {
        return carRepository.findByIsRentedTrue();
    }

    @Transactional
    public void createCar(String name, int year, String color, int capacity, String description, LocalDate importDate, int price, int producerId, MultipartFile image) {
        try {
            CarProducer carProducer = carProducerRepository.findById(producerId).orElse(null);
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
