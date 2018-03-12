package edu.ben.service;

import edu.ben.model.Location;

public interface LocationService {

    public void save(Location location);

    public Location getByName(String name);

    public void update(Location location);

}
