package hsf.project.service.Implement;

import hsf.project.pojo.Account;
import hsf.project.pojo.Customer;
import hsf.project.repository.CustomerRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CustomerServiceImpl {
    CustomerRepository customerRepository;
    AccoutServiceImpl accoutService;

    public Customer login(String email) {
        return customerRepository.findCustomerByEmail(email);
    }

    public Customer findCustomerByEmail(String email) {
        return customerRepository.findCustomerByEmail(email);
    }

    public Customer findCustomerById(int id) {
        return customerRepository.findById(id).orElse(null);
    }

    @Transactional
    public void create(String name, String mobile, LocalDate birthday, String identity, String licenceNumber, LocalDate licenceDate, String email, String password) {
        Customer customer = Customer.builder()
                .customerName(name)
                .mobile(mobile)
                .birthday(birthday)
                .identityCard(identity)
                .licenceNumber(licenceNumber)
                .licenceDate(licenceDate)
                .email(email)
                .password(password)
                .build();
        customerRepository.save(customer);
        Account account = Account.builder()
                .customer(customer)
                .accountName(customer.getCustomerName())
                .role("CUSTOMER")
                .build();
        accoutService.createAccount(account);
    }

    @Transactional
    public void update(int id, String name, String mobile, String licenceNumber, LocalDate licenceDate, String password) {
        Customer customer = findCustomerById(id);
        if (customer != null) {
            customer.setCustomerName(name);
            customer.setMobile(mobile);
            customer.setLicenceNumber(licenceNumber);
            customer.setLicenceDate(licenceDate);
            customer.setPassword(password);
            customerRepository.save(customer);
        }
    }

    @Transactional
    public void delete(int id) {
        Customer customer = findCustomerById(id);
        if (customer != null) {
            customerRepository.delete(customer);
        }
    }
}
