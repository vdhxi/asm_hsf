package hsf.project.service;

import hsf.project.pojo.Car;
import hsf.project.pojo.Customer;
import hsf.project.pojo.Review;

import java.util.List;

public interface ReviewService {
    Review getReviewById(int id);
    List<Review> getAllReviews();
    List<Review> getReviewsByCar(Car car);
    List<Review> getReviewsByCustomer(Customer customer);
    void createReview(String comment, int rating, Customer customer, Car car);
    void updateReview(int id, String comment, int rating);
    void deleteReviewById(int id);
}
