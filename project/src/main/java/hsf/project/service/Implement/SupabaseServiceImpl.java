package hsf.project.service.Implement;

import hsf.project.config.SupabaseConfig;
import hsf.project.service.SupabaseService;
import lombok.RequiredArgsConstructor;
import okhttp3.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class SupabaseServiceImpl implements SupabaseService {
    private final OkHttpClient client = new OkHttpClient();
    private final SupabaseConfig config;

    public String upload(MultipartFile file, String name) throws IOException {
        if (file.isEmpty()) {
            throw new IOException("File is empty");
        }

        // Print debug information
        System.out.println("Uploading file to Supabase");
        System.out.println("Base URL: " + config.getUrl());
        System.out.println("Bucket name: " + config.getBucket());
        System.out.println("File name: " + name);
        System.out.println("File size: " + file.getSize() + " bytes");

        // Create MultipartBody for file upload
        RequestBody requestBody = new MultipartBody.Builder()
                .setType(MultipartBody.FORM)
                .addFormDataPart("file", name,
                        RequestBody.create(file.getBytes(), MediaType.parse(file.getContentType())))
                .build();

        // Create request with proper endpoint for Supabase Storage
        String uploadUrl = config.getUrl() + "/storage/v1/object/" + config.getBucket() + "/" + name;
        System.out.println("Upload URL: " + uploadUrl);

        // For uploading to buckets with RLS policies, we need to use service_role key
        // which bypasses RLS policies
        Request request = new Request.Builder()
                .url(uploadUrl)
                .header("apikey", config.getKey())
                .header("Authorization", "Bearer " + config.getKey())
                .post(requestBody)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                String errorMessage = "Upload failed: " + response.code();
                if (response.body() != null) {
                    String responseBody = response.body().string();
                    System.err.println(errorMessage + " " + responseBody);
                    return "Upload error: " + responseBody;
                }
                System.err.println(errorMessage);
                throw new IOException("Failed to upload file: "+response.code()+" "+response.body().string());
            }

            // If successful, return public URL
            String publicUrl = config.getUrl() + "/storage/v1/object/public/" + config.getBucket() + "/" + name;
            System.out.println("Upload successful. Public URL: " + publicUrl);
            return publicUrl;
        }
    }

    public boolean delete(String name) throws IOException {
        Request request = new Request.Builder()
                .url(config.getUrl()+"/storage/v1/object/" + config.getBucket() + "/" + name)
                .header("apikey", config.getKey())
                .header("Authorization", "Bearer " + config.getKey())
                .delete()
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Failed to delete file"+response.code()+" "+response.body().string());
            }
            return true;
        }
    }

    public String getImage(String name) {
        String imageUrl = config.getUrl()+"/storage/v1/object/public/" + config.getBucket() + "/" + name;

        Request request = new Request.Builder()
                .url(imageUrl)
                .head()
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (response.isSuccessful()) {
                return imageUrl;
            } else {
                throw new IOException("Failed to get image url");
            }
        } catch (IOException e) {
            return "Could not get image";
        }
    }
}
