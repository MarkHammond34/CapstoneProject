package edu.ben.dao;

import edu.ben.model.Image;

import java.util.List;

public interface ImageDAO {

    public void saveOrUpdate(Image image);

    public List<Image> getImagesByListingId(int listingId);

    public List<Image> getImagesByUserId(int userId);
}
