package hsf.project.service.Implement;

import hsf.project.enums.RentalStatus;
import hsf.project.pojo.Car;
import hsf.project.pojo.CarRental;
import hsf.project.pojo.Customer;
import hsf.project.repository.CarRentalRepository;
import hsf.project.repository.CarRepository;
import hsf.project.service.CarRentalService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CarRentalServiceImpl implements CarRentalService {
    CarRentalRepository carRentalRepository;
    CarRepository carRepository;


    public CarRental getCarRentalById(int id) {
        return carRentalRepository.findById(id);
    }

    public List<CarRental> getAllCarRentals() {
        return carRentalRepository.findAll();
    }

    public List<CarRental> getAllByCustomer(Customer customer) {
        return carRentalRepository.findByCustomer(customer);
    }

    public List<CarRental> getAllByDateBetween(LocalDate startDate, LocalDate endDate) {
        return carRentalRepository.findByPickupDateAfterAndReturnDateBefore(startDate.minusDays(1), endDate.plusDays(1));
    }


    public List<CarRental> getAllByRentStatus(RentalStatus status) {
        return carRentalRepository.findByStatus(status);
    }

    @Transactional
    public CarRental createCarRental(LocalDate pickupDate, LocalDate returnDate, int price, Customer customer, Car car) {
        RentalStatus status = RentalStatus.WAITING;
        if (pickupDate.equals(LocalDate.now())) {
            status = RentalStatus.RENTING;
        }
        CarRental carRental = CarRental.builder()
                .pickupDate(pickupDate)
                .returnDate(returnDate)
                .rentPrice(price)
                .status(status)
                .customer(customer)
                .car(car)
                .isReviewed(false)
                .build();
        if (pickupDate.equals(LocalDate.now())) {
            car.setRented(true);
            carRepository.save(car);
        }
        return carRentalRepository.save(carRental);
    }

    @Transactional
    public void updateCarRental(int id, LocalDate returnDate) {
        CarRental carRental = getCarRentalById(id);
        int price = carRental.getCar().getRentPrice()*(int) ChronoUnit.DAYS.between(carRental.getPickupDate(), returnDate);
        carRental.setReturnDate(returnDate);

        if (carRental.getPickupDate().equals(returnDate)) {
            price = (int) (carRental.getCar().getRentPrice() * 0.5);
        }
        carRental.setRentPrice(price);
        if (returnDate.equals(LocalDate.now())) {
            updateStatus(carRental, RentalStatus.COMPLETED);
        }
        carRentalRepository.save(carRental);
    }

    @Transactional
    public void updateStatus(CarRental carRental, RentalStatus status) {
        Car car = carRental.getCar();
        carRental.setStatus(status);
        if (carRental.getStatus() == RentalStatus.RENTING) {
            car.setRented(true);
            carRepository.save(car);
        } else if (carRental.getStatus() == RentalStatus.COMPLETED) {
            car.setRented(false);
            carRepository.save(car);
        }
        carRentalRepository.save(carRental);
    }

    @Transactional
    public void cancelCarRental(int id) {
        CarRental carRental = getCarRentalById(id);
        Car car = carRental.getCar();
        carRental.setStatus(RentalStatus.CANCELLED);
        car.setRented(false);
        carRepository.save(car);
        carRentalRepository.save(carRental);
    }

    @Transactional
    public void markReviewed(int id) {
        CarRental carRental = getCarRentalById(id);
        carRental.setReviewed(true);
        carRentalRepository.save(carRental);
    }

    @Transactional
    public void deleteCarRental(int id) {
        CarRental carRental = getCarRentalById(id);
        carRentalRepository.delete(carRental);
    }


}
