package edu.ben.service;

import edu.ben.model.Image;

import java.util.List;

public interface ImageService {

    public void saveOrUpdate(Image image);

    public List<Image> getImagesByListingId(int listingId);

    public List<Image> getImagesByUserId(int userId);
}
