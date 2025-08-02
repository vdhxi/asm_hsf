package hsf.project.service;

import hsf.project.pojo.Car;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

public interface CarService {
    Car findCarById(int id);
    List<Car> getAllCars();
    List<Car> getAllCarsAvailableBetween(LocalDate from, LocalDate to);
    List<Car> getAllCarsByBrand(int id, List<Car> carList);
    List<Car> getAllCarsByCapacity(List<Car> carList, int min, int max);
    List<Car> getAllCarsByPrice(List<Car> carList, int min, int max);
    List<Car> sortByPriceAscending(List<Car> carList);
    List<Car> sortByPriceDescending(List<Car> carList);
    void createCar(String name, int year, String color, int capacity, String description, int price, int producerId, MultipartFile image);
    void updateCar(int id, String name, int year, String color, int capacity, String description, int price, int producerId, boolean rented, MultipartFile image);
    void deleteCar(int id);
    int countTotalCars();
    int countRentedCars();
    int countUnRentedCars();

}
