package edu.ben.dao;

import edu.ben.model.Location;

import java.util.List;

public interface LocationDAO {

    public void save(Location location);

    public void update(Location location);

    public List getAllSafeZones();

}
