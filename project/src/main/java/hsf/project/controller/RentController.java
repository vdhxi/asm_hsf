package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.pojo.Customer;
import hsf.project.service.CarRentalService;
import hsf.project.service.CarService;
import jakarta.servlet.http.HttpSession;
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

    @PostMapping()
    public String rent(int id, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        Car car = carService.findCarById(id);
        session.setAttribute("car", car);
        return "rent";
    }

    @PostMapping("/create")
    public String create(int id, HttpSession session, LocalDate pickUpDate, LocalDate returnDate, int totalPrice) {
        Customer customer = (Customer) session.getAttribute("customer");
        System.out.println(customer.getCustomerName());
        if (customer == null) {
            return "redirect:/login";
        }
        Car car = carService.findCarById(id);
        System.out.println(car.getCarName());
        carRentalService.createCarRental(pickUpDate, returnDate, totalPrice, customer, car);
        return "redirect:/home";
    }

}
