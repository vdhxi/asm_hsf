package hsf.project.config;

import hsf.project.pojo.Account;
import hsf.project.pojo.Customer;
import hsf.project.repository.AccountRepository;
import hsf.project.repository.CustomerRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InitConfig implements CommandLineRunner {
    AccountRepository accountRepository;
    CustomerRepository customerRepository;

    @Override
    @Transactional
    public void run(String... args) {
        Customer userTest = customerRepository.findCustomerByEmail("user");
        Customer adminTest = customerRepository.findCustomerByEmail("admin");
        if (userTest == null) {
            userTest = Customer.builder()
                    .customerName("User test")
                    .mobile("123456")
                    .birthday(LocalDate.ofEpochDay(2004-11-10))
                    .identityCard("user")
                    .licenceNumber("user")
                    .licenceDate(LocalDate.ofEpochDay(2022-12-18))
                    .email("user")
                    .password("user")
                    .build();
            customerRepository.save(userTest);
            Account user = Account.builder()
                    .customer(userTest)
                    .accountName(userTest.getCustomerName())
                    .role("CUSTOMER")
                    .build();
            accountRepository.save(user);
        }
        if (adminTest == null) {
            adminTest = Customer.builder()
                    .customerName("Admin test")
                    .mobile("123456")
                    .birthday(LocalDate.ofEpochDay(2004-11-10))
                    .identityCard("admin")
                    .licenceNumber("admin")
                    .licenceDate(LocalDate.ofEpochDay(2022-12-18))
                    .email("admin")
                    .password("admin")
                    .build();
            customerRepository.save(adminTest);
            Account admin = Account.builder()
                    .customer(adminTest)
                    .accountName(adminTest.getCustomerName())
                    .role("ADMIN")
                    .build();
            accountRepository.save(admin);
        }

    }
}
