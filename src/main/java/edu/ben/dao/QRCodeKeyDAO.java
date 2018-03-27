package edu.ben.dao;

import edu.ben.model.QRCodeKey;

public interface QRCodeKeyDAO {

    public void save(QRCodeKey key);

    public void update(QRCodeKey key);

    public QRCodeKey getByKey(String key);

    public QRCodeKey getByPickUpID(int pickUpID);
}
