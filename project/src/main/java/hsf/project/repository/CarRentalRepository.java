package hsf.project.repository;

import hsf.project.enums.RentalStatus;
import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.pojo.CarRental;
import hsf.project.pojo.Customer;
import org.jetbrains.annotations.NotNull;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface CarRentalRepository extends CrudRepository<CarRental, Integer> {
    @NotNull List<CarRental> findAll();

    List<CarRental> findByCustomer(Customer customer);

    List<CarRental> findByCar(Car car);

    List<CarRental> findByPickupDateBetween(LocalDate startDate, LocalDate endDate);

    List<CarRental> findByReturnDateBetween(LocalDate startDate, LocalDate endDate);

    List<CarRental> findByRentPriceBetween(int min, int max);

    List<CarRental> findByPickupDateAfterAndReturnDateBefore(LocalDate pickupDate, LocalDate returnDate);

    List<CarRental> findByStatus(RentalStatus status);

    List<CarRental> findByCarProducer(CarProducer carProducer);

    CarRental findById(int id);
}




