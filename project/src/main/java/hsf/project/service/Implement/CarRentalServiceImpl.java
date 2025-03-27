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
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CarRentalServiceImpl {
    CarRentalRepository carRentalRepository;
    CarRepository carRepository;


    public CarRental getCarRentalById(int id) {
        CarRental carRental = carRentalRepository.findById(id);
        return carRentalRepository.findById(id);
    }

    public List<CarRental> getAllCarRentals() {
        List<CarRental> list = carRentalRepository.findAll();
        if (!list.isEmpty()) {
            for (CarRental carRental : list) {
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
            }
        }
        return list;
    }

    public List<CarRental> getAllByCustomer(Customer customer) {
        List<CarRental> list = carRentalRepository.findByCustomer(customer);
        if (!list.isEmpty()) {
            for (CarRental carRental : list) {
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
            }
        }
        return list;
    }



    public List<CarRental> getAllByRentStatus(RentalStatus status) {
        return carRentalRepository.findByStatus(status);
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
    public void deleteCarRental(int id) {
        CarRental carRental = getCarRentalById(id);
        carRentalRepository.delete(carRental);
    }


}
