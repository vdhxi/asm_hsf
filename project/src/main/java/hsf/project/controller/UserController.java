package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.pojo.Customer;
import hsf.project.service.Implement.CarServiceImpl;
import hsf.project.service.Implement.CustomerServiceImpl;
import hsf.project.service.Implement.ReviewServiceImpl;
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
@RequestMapping("/user")
public class UserController {
    CustomerServiceImpl customerService;
    ReviewServiceImpl reviewService;
    CarServiceImpl carService;

    @PostMapping("/add")
    public String addUser(String name, String mobile, String email, String password, LocalDate birthday, LocalDate licenceDate, String identity, String licenceNumber) {
        customerService.create(name, mobile, birthday, identity, licenceNumber, licenceDate, email, password);
        return "login";
    }

    @PostMapping("/update")
    public String updateUser(HttpSession session, String name, String mobile,String licenceNumber, LocalDate licenceDate) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "login";
        }
        customerService.update(customer.getId(), name, mobile, licenceNumber, licenceDate, customer.getPassword());
        return "redirect:/profile";
    }

    @PostMapping("/changePassword")
    public String changePassword(HttpSession session, String oldPassword, String newPassword) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "login";
        } else {
            if (customer.getPassword().equals(oldPassword)) {
                customerService.update(customer.getId(), customer.getCustomerName(), customer.getMobile(), customer.getLicenceNumber(), customer.getLicenceDate(), newPassword);
            }
            customer.setPassword(newPassword);
            session.setAttribute("customer", customer);
        }
        return "redirect:/profile";
    }

    @PostMapping("/delete")
    public String deleteUser(int id) {
        customerService.delete(id);
        return "redirect:/management";
    }

    @PostMapping("/review")
    public String review(HttpSession session, String comment, int rating, int id) {
        Customer customer = (Customer) session.getAttribute("customer");
        Car car = carService.findCarById(id);
        if (customer == null) {
            return "login";
        }
        reviewService.createReview(comment, rating, customer, car);
        return "redirect:/profile";
    }
}
