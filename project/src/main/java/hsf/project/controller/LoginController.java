package hsf.project.controller;

import hsf.project.pojo.Customer;
import hsf.project.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LoginController {

    CustomerService customerService;

    @GetMapping("/login")
    public String login(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            session.setAttribute("customer", customer);
            if (customer.getAccount().getRole().equalsIgnoreCase("ADMIN")) {
                return "redirect:/management";
            } else {
                return "redirect:/home";
            }
        } else {
            return "login";
        }
    }

    @PostMapping("/login")
    public String login(String email, String password, HttpSession session, Model model) {
        Customer customer = customerService.findCustomerByEmail(email);
        if (customer != null) {
            if (!customer.getPassword().equals(password)) {
                model.addAttribute("error","Wrong password");
            } else {
                session.setAttribute("customer", customer);
                switch (customer.getAccount().getRole()) {
                    case "ADMIN":
                        return "redirect:/management";
                    case "CUSTOMER":
                        return "redirect:/home";
                }
            }
        } else {
            model.addAttribute("error","Account does not exist");
        }
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }


}
