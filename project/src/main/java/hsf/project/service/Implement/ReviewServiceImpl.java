package hsf.project.service.Implement;

import hsf.project.pojo.Car;
import hsf.project.pojo.Customer;
import hsf.project.pojo.Review;
import hsf.project.repository.ReviewRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReviewServiceImpl {
    ReviewRepository reviewRepository;

    public Review getReviewById(int id) {
        return reviewRepository.findById(id).orElse(null);
    }

    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }

    public List<Review> getReviewsByCar(Car car) {
        return reviewRepository.findByCar(car);
    }

    public List<Review> getReviewsByCustomer(Customer customer) {
        return reviewRepository.findByCustomer(customer);
    }

    @Transactional
    public Review createReview(String comment, int rating, Customer customer, Car car) {
        Review review = Review.builder()
                .comment(comment)
                .reviewStar(rating)
                .customer(customer)
                .car(car)
                .build();
        return reviewRepository.save(review);
    }

    @Transactional
    public void updateReview(int id, String comment, int rating) {
        Review review = reviewRepository.findById(id).orElse(null);
        review.setComment(comment);
        review.setReviewStar(rating);
        reviewRepository.save(review);
    }

    @Transactional
    public void deleteReviewById(int id) {
        reviewRepository.deleteById(id);
    }

}
