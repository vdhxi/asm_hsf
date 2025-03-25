package hsf.project.pojo;

import hsf.project.enums.RentalStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CarRental {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    LocalDate pickupDate;
    LocalDate returnDate;
    int rentPrice;
    RentalStatus status;

    @ManyToOne(fetch = FetchType.LAZY)
    Car car;

    @ManyToOne(fetch = FetchType.LAZY)
    Customer customer;
}
