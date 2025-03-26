package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.service.Implement.CarProducerServiceImpl;
import hsf.project.service.Implement.CarServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class HomeController {
    CarProducerServiceImpl carProducerService;
    CarServiceImpl carService;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/home")
    public String homeReturn(HttpSession session) {
        return "home";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/listing")
    public String listing(HttpSession session) {
        List<Car> carList = carService.getAllCarsAvailable();
        session.setAttribute("carList", carList);
        return "listing";
    }

    @GetMapping("/review")
    public String review() {
        return "review";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }
}
