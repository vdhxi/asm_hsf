package hsf.project.pojo;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String carName; //1
    int carModelYear; //2
    String color; //3
    int capacity; //4
    String description; //5
    LocalDate importDate; //6

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference
    CarProducer producer; //7

    String url; //8
    int rentPrice; //9
    boolean isRented;

    @OneToMany(mappedBy = "car")
    List<Review> reviewList;

    @OneToMany(mappedBy = "car")
    List<CarRental> carRentalList;
}
