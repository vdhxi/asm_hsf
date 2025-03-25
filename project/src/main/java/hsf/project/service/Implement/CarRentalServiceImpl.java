package hsf.project.service.Implement;

import hsf.project.enums.RentalStatus;
import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.pojo.CarRental;
import hsf.project.pojo.Customer;
import hsf.project.repository.CarProducerRepository;
import hsf.project.repository.CarRentalRepository;
import hsf.project.repository.CarRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CarRentalServiceImpl {
    CarRentalRepository carRentalRepository;
    CarRepository carRepository;
    CarProducerRepository carProducerRepository;

    public CarRental getCarRentalById(int id) {
        return carRentalRepository.findById(id);
    }

    public List<CarRental> getAllCarRentals() {
        return carRentalRepository.findAll();
    }

    public List<CarRental> getAllByCustomer(Customer customer) {
        return carRentalRepository.findByCustomer(customer);
    }

    public List<CarRental> getAllByCar(Car car) {
        return carRentalRepository.findByCar(car);
    }

    public List<CarRental> getAllByPickupDateBetween(LocalDate startDate, LocalDate endDate) {
        return carRentalRepository.findByPickupDateBetween(startDate, endDate);
    }

    public List<CarRental> getAllByReturnDateBetween(LocalDate startDate, LocalDate endDate) {
        return carRentalRepository.findByReturnDateBetween(startDate, endDate);
    }

    public List<CarRental> getAllByRentPriceBetween(int startPrice, int endPrice) {
        return carRentalRepository.findByRentPriceBetween(startPrice, endPrice);
    }

    public List<CarRental> getAllByPickupAndReturnDateBetween(LocalDate startDate, LocalDate endDate) {
        return carRentalRepository.findByPickupDateAfterAndReturnDateBefore(startDate, endDate);
    }

    public List<CarRental> getAllByRentStatus(RentalStatus status) {
        return carRentalRepository.findByStatus(status);
    }

    public List<CarRental> getAllByProducer(CarProducer carProducer) {
        return carRentalRepository.findByCarProducer(carProducer);
    }

    @Transactional
    public CarRental createCarRental(LocalDate pickupDate, LocalDate returnDate, int price, Customer customer, Car car) {
        CarRental carRental = CarRental.builder()
                .pickupDate(pickupDate)
                .returnDate(returnDate)
                .rentPrice(price)
                .status(RentalStatus.WAITING)
                .customer(customer)
                .car(car)
                .build();
        return carRentalRepository.save(carRental);
    }

    @Transactional
    public void updateCarRental(int id, LocalDate pickupDate, LocalDate returnDate, int price, Car car) {
        CarRental carRental = getCarRentalById(id);
        carRental.setPickupDate(pickupDate);
        carRental.setReturnDate(returnDate);
        carRental.setRentPrice(price);
        carRental.setCar(car);
        carRentalRepository.save(carRental);
    }

    @Transactional
    public void updateStatus(int id, RentalStatus status) {
        CarRental carRental = getCarRentalById(id);
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
    public void deleteCarRental(int id) {
        CarRental carRental = getCarRentalById(id);
        carRentalRepository.delete(carRental);
    }


}
