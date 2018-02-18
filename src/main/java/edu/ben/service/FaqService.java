package edu.ben.service;

import edu.ben.model.Faq;

import java.util.List;

public interface FaqService {

    public void save(Faq faq);

    public List getAllFaqs();
}
