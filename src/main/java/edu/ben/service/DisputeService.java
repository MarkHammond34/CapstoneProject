package edu.ben.service;

import edu.ben.model.Dispute;

public interface DisputeService {

    public void save(Dispute dispute);

    public void update(Dispute dispute);

    public Dispute getByID(int id);
}
