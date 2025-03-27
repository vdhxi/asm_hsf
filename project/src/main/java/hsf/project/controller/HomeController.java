package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.pojo.CarRental;
import hsf.project.pojo.Customer;
import hsf.project.service.Implement.CarProducerServiceImpl;
import hsf.project.service.Implement.CarRentalServiceImpl;
import hsf.project.service.Implement.CarServiceImpl;
import hsf.project.service.Implement.CustomerServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDate;
import java.util.List;


@Controller
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class HomeController {
    CarProducerServiceImpl carProducerService;
    CarServiceImpl carService;
    CustomerServiceImpl customerService;
    CarRentalServiceImpl carRentalService;

    @GetMapping("/")
    public String home(HttpSession session) {
        List<CarProducer> carProducerList = carProducerService.getAllCarProducers();
        session.setAttribute("carProducerList", carProducerList);
        return "home";
    }

    @GetMapping("/home")
    public String homeReturn(HttpSession session) {
        List<CarProducer> carProducerList = carProducerService.getAllCarProducers();
        session.setAttribute("carProducerList", carProducerList);
        return "home";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable int id, HttpSession session) {
        Car car = carService.findCarById(id);
        session.setAttribute("car", car);
        return "detail";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/listing")
    public String listing(HttpSession session) {
        LocalDate from = (LocalDate) session.getAttribute("from");
        LocalDate to = (LocalDate) session.getAttribute("to");
        if (from == null) {
            from = LocalDate.now();
        }
        if (to == null) {
            to = LocalDate.now().plusDays(1);
        }
        List<Car> carList = carService.getAllCarsAvailableBetween(from, to);
        session.setAttribute("carList", carList);
        session.setAttribute("listInit", carList);
        List<CarProducer> carProducerList = carProducerService.getAllCarProducers();
        session.setAttribute("carProducerList", carProducerList);
        System.out.println("From: " + from+" To: " + to);
        return "listing";
    }

    @GetMapping("/review")
    public String review() {
        return "review";
    }

    @GetMapping("/profile")
    public String contact(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        }
        String email = customer.getEmail();
        Customer newCustomer = customerService.findCustomerByEmail(email);
        if (newCustomer != null) {
            session.setAttribute("customer", newCustomer);
        }

        List<CarRental> carRentalList = carRentalService.getAllByCustomer(newCustomer);
        for (CarRental carRental : carRentalList) {
            System.out.println(carRental.getCar().getCarName() +" - "+carRental.getId()+" - "+carRental.getPickupDate()+" - "+carRental.getReturnDate()+" - "+carRental.getStatus());
        }
        session.setAttribute("carRentalList", carRentalList);
        return "profile";
    }
}
