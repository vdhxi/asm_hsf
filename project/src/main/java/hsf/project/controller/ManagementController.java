package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.pojo.CarRental;
import hsf.project.pojo.Customer;
import hsf.project.service.CarProducerService;
import hsf.project.service.CarRentalService;
import hsf.project.service.CarService;
import hsf.project.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.format.annotation.DateTimeFormat;
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
    CarProducerService carProducerService;
    CarService carService;
    CarRentalService carRentalService;
    CustomerService customerService;

    @GetMapping
    public String management(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/home";
            }
        }
        int totalCarManufacture = carProducerService.getAllCarProducers().size();
        int totalCar = carService.countTotalCars();
        int totalCarRenting = carService.countRentedCars();
        int totalCarAvailable = carService.countUnRentedCars();
        List<CarProducer> carProducerList = carProducerService.getAllCarProducers();
        session.setAttribute("carProducerList", carProducerList);
        List<Car> carList = carService.getAllCars();
        session.setAttribute("carList", carList);
        session.setAttribute("totalCarManufacture", totalCarManufacture);
        session.setAttribute("totalCar", totalCar);
        session.setAttribute("totalCarRenting", totalCarRenting);
        session.setAttribute("totalCarAvailable", totalCarAvailable);
        return "management";
    }

    @GetMapping("/rental")
    public String rental(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/home";
            }
        }
        List<CarRental> carRentalList = carRentalService.getAllCarRentals();
        session.setAttribute("carRentalList", carRentalList);
        return "rentalManagement";
    }

    @GetMapping("/user")
    public String user(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/home";
            }
        }
        List<Customer> customerList = customerService.findAll();
        session.setAttribute("customerList", customerList);
        return "userManagement";
    }

    @PostMapping("/manufacture/add")
    public String addManufacture(HttpSession session, String name, String country) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carProducerService.saveCarProducer(name, country);
        return "redirect:/management";
    }

    @PostMapping("/manufacture/update")
    public String updateManufacture(HttpSession session, int id, String name, String country) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carProducerService.updateCarProducer(id, name, country);
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
        if (year < 1 || capacity < 1 || price < 1) {
            return "redirect:/management";
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

    @PostMapping("/rental/update")
    public String userReturn(int id, HttpSession session, @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate returnDate) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        carRentalService.updateCarRental(id, returnDate);
        return "redirect:/management/rental";
    }

    @PostMapping("/user/update")
    public String userUpdate(int id, HttpSession session, String name, String mobile, String identity, String licence, LocalDate licenceDate) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/login";
            }
        }
        customerService.adminUpdate(id, name, mobile, identity, licence, licenceDate);
        return "redirect:/management/user";
    }

    @GetMapping("/filter")
    public String filter(int id, HttpSession session, LocalDate from, LocalDate to) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        } else {
            if (!customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/home";
            }
        }
        List<CarRental> carRentalList = carRentalService.getAllByDateBetween(from, to);
        session.setAttribute("carRentalList", carRentalList);
        return "rentalManagement";
    }
}
