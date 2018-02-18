package edu.ben.dao;

import edu.ben.model.Faq;

import java.util.List;

public interface FaqDAO {

    public void save(Faq faq);

    public void update(Faq faq);

    public List getAllFaqs();
}
