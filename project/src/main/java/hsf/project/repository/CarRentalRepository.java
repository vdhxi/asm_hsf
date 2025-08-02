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
import java.util.Set;

@Repository
public interface CarRentalRepository extends CrudRepository<CarRental, Integer> {
    @NotNull List<CarRental> findAll();

    List<CarRental> findByCustomer(Customer customer);

    List<CarRental> findByPickupDateAfterAndReturnDateBefore(LocalDate pickupDate, LocalDate returnDate);

    List<CarRental> findByRentPriceBetween(int min, int max);

    List<CarRental> findByStatus(RentalStatus status);

    List<CarRental> findByCarProducer(CarProducer carProducer);

    CarRental findById(int id);


    List<CarRental> findByCarAndPickupDateBetweenAndStatusNotIn(Car car, LocalDate from, LocalDate to, List<RentalStatus> status);
    List<CarRental> findByCarAndReturnDateBetweenAndStatusNotIn(Car car, LocalDate from, LocalDate to, List<RentalStatus> status);
    List<CarRental> findByCarAndPickupDateAfterAndReturnDateBeforeAndStatusNotIn(Car car, LocalDate from, LocalDate to, List<RentalStatus> status);
    List<CarRental> findByCarAndPickupDateBeforeAndReturnDateAfterAndStatusNotIn(Car car, LocalDate from, LocalDate to, List<RentalStatus> status);
}




