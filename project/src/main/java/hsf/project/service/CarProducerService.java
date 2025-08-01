package hsf.project.service;

import hsf.project.pojo.CarProducer;

import java.util.List;

public interface CarProducerService {
    CarProducer getCarProducer(int id);
    List<CarProducer> getAllCarProducers();
    void saveCarProducer(String producerName, String address, String country);
    void updateCarProducer(int id, String producerName, String address, String country);
    void deleteCarProducer(int id);
}
