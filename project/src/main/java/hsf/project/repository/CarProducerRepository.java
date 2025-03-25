package hsf.project.repository;

import hsf.project.pojo.CarProducer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarProducerRepository extends CrudRepository<CarProducer,Integer> {
    List<CarProducer> findAll();
    CarProducer findCarProducerByProducerName(String producerName);
    List<CarProducer> findCarProducerByCountry(String country);
}
