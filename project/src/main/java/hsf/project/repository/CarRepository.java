package hsf.project.repository;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarRepository extends JpaRepository<Car, Integer> {
    List<Car> findByIsRentedTrue();
    List<Car> findByIsRentedFalse();
    Car findById(int id);
}
