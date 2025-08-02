package hsf.project.service;

import hsf.project.pojo.Customer;

import java.time.LocalDate;
import java.util.List;

public interface CustomerService {
    Customer login(String email);
    List<Customer> findAll();
    Customer findCustomerByEmail(String email);
    Customer findCustomerById(int id);
    void create(String name, String mobile, LocalDate birthday, String identity, String licenceNumber, LocalDate licenceDate, String email, String password);
    void update(int id, String name, String mobile, String licenceNumber, LocalDate licenceDate, String password);
    void adminUpdate(int id, String name, String mobile, String identityNumber, String licenceNumber, LocalDate licenceDate);
    void delete(int id);

}
