package edu.ben.dao;

import edu.ben.model.PickUp;

public interface PickUpDAO {

    public void save(PickUp pickUp);

    public void update(PickUp pickUp);

    public PickUp getPickUpByListingID(int id);

    public PickUp getPickUpByPickUpID(int id);

}
