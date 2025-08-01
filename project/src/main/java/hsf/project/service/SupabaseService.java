package hsf.project.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface SupabaseService {
    String upload(MultipartFile file, String name)  throws IOException;
    boolean delete(String name) throws IOException;
    String getImage(String name);
}
