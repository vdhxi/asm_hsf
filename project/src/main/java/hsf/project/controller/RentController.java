package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarRental;
import hsf.project.pojo.Customer;
import hsf.project.service.CarRentalService;
import hsf.project.service.CarService;
import hsf.project.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;

@Controller
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/rent")
public class RentController {
    CarService carService;
    CarRentalService carRentalService;
    ReviewService reviewService;

    @PostMapping()
    public String rent(int id, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/management";
            }
        }
        Car car = carService.findCarById(id);
        session.setAttribute("car", car);
        return "rent";
    }

    @PostMapping("/create")
    public String create(int id, HttpSession session, LocalDate pickUpDate, LocalDate returnDate, String totalPrice) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/management";
            }
        }
        Car car = carService.findCarById(id);
        int total = Integer.parseInt(totalPrice.replaceAll(",", ""));
        System.out.println(car.getCarName());
        carRentalService.createCarRental(pickUpDate, returnDate, total, customer, car);
        return "redirect:/profile";
    }

    @PostMapping("/cancel")
    public String cancel(HttpSession session, int id) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        }
        carRentalService.cancelCarRental(id);
        return "redirect:/profile";
    }

    @PostMapping("/review")
    public String review(HttpSession session, String comment, @Min(value = 1) @Max(value = 5) int rating, int id) {
        Customer customer = (Customer) session.getAttribute("customer");
        CarRental carRental = carRentalService.getCarRentalById(id);
        Car car = carRental.getCar();
        if (customer == null) {
            return "login";
        }
        reviewService.createReview(comment, rating, customer, car);
        carRentalService.markReviewed(id);
        return "redirect:/profile";
    }


}
