package hsf.project.pojo;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CarProducer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int producerId;
    String producerName;
    String address;
    String country;
}
