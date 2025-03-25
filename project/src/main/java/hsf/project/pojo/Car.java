package hsf.project.pojo;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int carId;
    String carName;
    int carModelYear;
    String color;
    int capacity;
    String description;
    LocalDate importDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference
    CarProducer producer;

    float rentPrice;
    boolean status;
}
