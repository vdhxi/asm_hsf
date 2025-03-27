package hsf.project.repository;

import hsf.project.pojo.Car;
import hsf.project.pojo.Customer;
import hsf.project.pojo.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {
    List<Review> findByCar(Car car);

    List<Review> findByCustomer(Customer customer);
}
