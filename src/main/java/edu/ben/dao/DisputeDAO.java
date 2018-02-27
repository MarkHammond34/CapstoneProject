package edu.ben.dao;

import edu.ben.model.Dispute;

public interface DisputeDAO {

    public void save(Dispute dispute);

    public void update(Dispute dispute);

    public Dispute getByID(int id);

}
