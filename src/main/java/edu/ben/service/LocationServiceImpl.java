package edu.ben.service;

import edu.ben.dao.LocationDAO;
import edu.ben.model.Location;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class LocationServiceImpl implements LocationService {

    LocationDAO locationDAO;

    @Autowired
    public void setLocationDAO(LocationDAO locationDAO) {
        this.locationDAO = locationDAO;
    }

    public void save(Location location) {
        locationDAO.save(location);
    }
}
