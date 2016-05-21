package com.mountainmarket.util;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;
import lombok.Data;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.Map;

@Data
public class CloudManager {

    private Cloudinary cloudinary;
    
    
    public Map uploadImage(File image, int width) throws IOException{
        Map uploadResult = null;
        uploadResult = cloudinary.uploader().upload(image,
                    ObjectUtils.asMap("transformation",new Transformation().width(width)));
        return uploadResult;
    }
    
    //default sized upload
    public Map uploadImage(File image) throws IOException{
        return uploadImage(image, 1000);
    }
    
    public void deleteImage(String publicId) throws IOException{
        cloudinary.uploader().destroy(publicId, ObjectUtils.asMap("invalidate", true));
    }


    public CloudManager(Map cloudParams) {
        cloudinary = new Cloudinary(cloudParams);
    }
}
