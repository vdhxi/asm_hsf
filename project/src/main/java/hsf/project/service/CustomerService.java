package hsf.project.service;

import hsf.project.pojo.Customer;

import java.time.LocalDate;

public interface CustomerService {
    Customer login(String email);
    Customer findCustomerByEmail(String email);
    Customer findCustomerById(int id);
    void create(String name, String mobile, LocalDate birthday, String identity, String licenceNumber, LocalDate licenceDate, String email, String password);
    void update(int id, String name, String mobile, String licenceNumber, LocalDate licenceDate, String password);
    void delete(int id);
}
