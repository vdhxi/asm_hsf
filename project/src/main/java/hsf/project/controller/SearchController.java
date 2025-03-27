package hsf.project.controller;

import hsf.project.pojo.Car;
import hsf.project.pojo.CarProducer;
import hsf.project.service.Implement.CarProducerServiceImpl;
import hsf.project.service.Implement.CarServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/search")
public class SearchController {
    CarServiceImpl carService;
    CarProducerServiceImpl carProducerService;

    @GetMapping()
    public String search(HttpSession session,
                         @RequestParam(defaultValue = "#{T(java.time.LocalDate).now()}")  @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate from,
                         @RequestParam(defaultValue = "#{T(java.time.LocalDate).now().plusDays(0)}") @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate to,
                         @RequestParam(defaultValue = "0") int id) {
        List<Car> carList = carService.getAllCarsAvailableBetween(from, to);
        session.setAttribute("listInit", carList);
        if (id != 0) {
            carList = carService.getAllCarsByBrand(id, carList);
        }
        List<CarProducer> carProducerList = carProducerService.getAllCarProducers();
        session.setAttribute("carProducerList", carProducerList);
        session.setAttribute("carList", carList);
        session.setAttribute("from", from);
        session.setAttribute("to", to);
        return "listing";
    }

    @GetMapping("/capacity")
    public String filterByCapacity(HttpSession session, @RequestParam(defaultValue = "0") int min, @RequestParam(defaultValue = "100") int max) {
        List<Car> carList = (List<Car>) session.getAttribute("carList");
        if (carList != null) {
            carList = carService.getAllCarsByCapacity(carList, min, max);
        }
        session.setAttribute("carList", carList);
        session.setAttribute("listInit", carList);
        return "listing";
    }

    @GetMapping("/price")
    public String filterByPrice(HttpSession session, @RequestParam(defaultValue = "0") int min, @RequestParam(defaultValue = "1000000") int max) {
        List<Car> carList = (List<Car>) session.getAttribute("listInit");
        if (carList != null) {
            carList = carService.getAllCarsByPrice(carList, min, max);
        }
        session.setAttribute("carList", carList);
        return "listing";
    }

    @GetMapping("/ascending")
    public String filterByAscending(HttpSession session) {
        List<Car> carList = (List<Car>) session.getAttribute("listInit");
        if (carList != null) {
            carList = carService.sortByPriceAscending(carList);
        }
        session.setAttribute("carList", carList);
        return "listing";
    }

    @GetMapping("/descending")
    public String filterByDescending(HttpSession session) {
        List<Car> carList = (List<Car>) session.getAttribute("listInit");
        if (carList != null) {
            carList = carService.sortByPriceDescending(carList);
        }
        session.setAttribute("carList", carList);
        return "listing";
    }

    @GetMapping("/manufacture")
    public String filterByManufacture(HttpSession session, int id) {
        List<Car> carList = (List<Car>) session.getAttribute("listInit");
        if (carList != null) {
            if (id != 0) {
                carList = carService.getAllCarsByBrand(id, carList);
            }
        }
        session.setAttribute("carList", carList);
        return "listing";
    }
}
