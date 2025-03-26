package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.pojo.Customer;
import hsf.project.service.Implement.CarProducerServiceImpl;
import hsf.project.service.Implement.CarServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/management")
public class ManagementController {
    CarProducerServiceImpl carProducerService;
    CarServiceImpl carService;

    @GetMapping
    public String management(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        List<CarProducer> carProducerList = carProducerService.getAllCarProducers();
        session.setAttribute("carProducerList", carProducerList);
        List<Car> carList = carService.getAllCars();
        session.setAttribute("carList", carList);
        return "management";
    }

    @PostMapping("/manufacture/add")
    public String addManufacture(HttpSession session, String name, String address, String country) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carProducerService.saveCarProducer(name, address, country);
        return "redirect:/management";
    }

    @PostMapping("/manufacture/update")
    public String updateManufacture(HttpSession session, int id, String name, String address, String country) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carProducerService.updateCarProducer(id, name, address, country);
        return "redirect:/management";
    }

    @PostMapping("/manufacture/delete")
    public String deleteManufacture(HttpSession session, int id) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carProducerService.deleteCarProducer(id);
        return "redirect:/management";
    }

    @PostMapping("/car/add")
    public String addCar(HttpSession session, String name, int year, String color, int capacity, String description, int price, int producerId, MultipartFile image) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carService.createCar(name, year, color, capacity, description, price, producerId, image);
        return "redirect:/management";
    }

    @PostMapping("/car/update")
    public String updateCar(HttpSession session, int id, String name, int year, String color, int capacity, String description, int price, int producerId, boolean status, MultipartFile image, RedirectAttributes redirectAttributes) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        if (image.isEmpty()) {
            carService.updateCar(id, name, year, color, capacity, description, price, producerId, status, null);
        } else {
            carService.updateCar(id, name, year, color, capacity, description, price, producerId, status, image);
            redirectAttributes.addFlashAttribute("refreshCache", true);
        }
        return "redirect:/management";
    }

    @PostMapping("/car/delete")
    public String deleteCar(HttpSession session, int id) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carService.deleteCar(id);
        return "redirect:/management";
    }
}
