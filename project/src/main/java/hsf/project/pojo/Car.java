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
    String carName;
    int carModelYear;
    String color;
    int capacity;
    @Lob
    @Column(columnDefinition = "NVARCHAR(MAX)")
    String description;
    LocalDate importDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference
    CarProducer producer;

    String url;
    int rentPrice;
    boolean isRented;
    boolean isActive;

    @OneToMany(mappedBy = "car")
    List<Review> reviewList;

    @OneToMany(mappedBy = "car")
    List<CarRental> carRentalList;
}
