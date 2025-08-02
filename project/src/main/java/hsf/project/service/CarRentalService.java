package hsf.project.service;

import hsf.project.enums.RentalStatus;
import hsf.project.pojo.Car;
import hsf.project.pojo.CarRental;
import hsf.project.pojo.Customer;

import java.time.LocalDate;
import java.util.List;

public interface CarRentalService {
    CarRental getCarRentalById(int id);
    List<CarRental> getAllCarRentals();
    List<CarRental> getAllByCustomer(Customer customer);
    List<CarRental> getAllByDateBetween(LocalDate startDate, LocalDate endDate);
    List<CarRental> getAllByRentStatus(RentalStatus status);
    CarRental createCarRental(LocalDate pickupDate, LocalDate returnDate, int price, Customer customer, Car car);
    void updateCarRental(int id, LocalDate returnDate);
    void updateStatus(CarRental carRental, RentalStatus status);
    void cancelCarRental(int id);
    void markReviewed(int id);
    void deleteCarRental(int id);

}
