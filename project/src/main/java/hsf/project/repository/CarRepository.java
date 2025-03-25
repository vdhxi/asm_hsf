package hsf.project.repository;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarRepository extends JpaRepository<Car, Integer> {
    List<Car> findByProducer(CarProducer producer);
    List<Car> findByColor(String color);
    List<Car> findByCapacityBetween(int min, int max);
    List<Car> findByCarModelYearBetween(int min, int max);
    List<Car> findByRentedTrue();
    Car findById(int id);
}
