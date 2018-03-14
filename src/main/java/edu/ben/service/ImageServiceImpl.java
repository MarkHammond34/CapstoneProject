package edu.ben.service;

import edu.ben.dao.ImageDAO;
import edu.ben.model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {

    ImageDAO imageDAO;

    @Autowired
    public void setImageDAO(ImageDAO imageDAO) {
        this.imageDAO = imageDAO;
    }

    @Override
    public void saveOrUpdate(Image image) {
        imageDAO.saveOrUpdate(image);
    }

    @Override
    public List<Image> getImagesByListingId(int listingId) {
        return imageDAO.getImagesByListingId(listingId);
    }

    @Override
    public List<Image> getImagesByUserId(int userId) {
        return imageDAO.getImagesByUserId(userId);
    }
}
