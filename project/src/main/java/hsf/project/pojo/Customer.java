package hsf.project.pojo;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String customerName;
    String mobile;
    LocalDate birthday;
    String identityCard;
    String licenceNumber;
    LocalDate licenceDate;
    String email;
    String password;

    @OneToOne(mappedBy = "customer", cascade = CascadeType.ALL)
    Account account;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    List<Review> reviewList;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    List<CarRental> carRentalList;
}
