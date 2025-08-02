package hsf.project.repository;

import hsf.project.pojo.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarRepository extends JpaRepository<Car, Integer> {
    List<Car> findAllByIsActiveTrue();
    List<Car> findByIsRentedTrueAndIsActiveTrue();
    List<Car> findByIsRentedFalse();
    Car findById(int id);
}
