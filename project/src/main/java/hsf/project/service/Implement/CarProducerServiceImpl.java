package hsf.project.service.Implement;

import hsf.project.pojo.CarProducer;
import hsf.project.repository.CarProducerRepository;
import hsf.project.service.CarProducerService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CarProducerServiceImpl implements CarProducerService {
    CarProducerRepository carProducerRepository;

    public CarProducer getCarProducer(int id) {
        return carProducerRepository.findById(id).orElse(null);
    }

    public CarProducer getCarProducerByName(String name) {
        return carProducerRepository.findCarProducerByProducerName(name);
    }

    public List<CarProducer> getAllCarProducers() {
        return carProducerRepository.findAll();
    }

    @Transactional
    public void saveCarProducer(String producerName, String address, String country) {
        CarProducer carProducer = CarProducer.builder()
                .producerName(producerName)
                .address(address)
                .country(country)
                .build();
        carProducerRepository.save(carProducer);
    }

    @Transactional
    public void updateCarProducer(int id, String producerName, String address, String country) {
        CarProducer carProducer = getCarProducer(id);
        if (carProducer != null) {
            carProducer.setProducerName(producerName);
            carProducer.setAddress(address);
            carProducer.setCountry(country);
            carProducerRepository.save(carProducer);
        }
    }

    @Transactional
    public void deleteCarProducer(int id) {
        CarProducer carProducer = getCarProducer(id);
        if (carProducer != null) {
            carProducerRepository.delete(carProducer);
        }
    }

    public int countCarProducers() {
        return carProducerRepository.findAll().size();
    }
}
