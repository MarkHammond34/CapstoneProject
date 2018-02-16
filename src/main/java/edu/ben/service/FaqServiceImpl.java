package edu.ben.service;

import edu.ben.dao.FaqDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class FaqServiceImpl implements FaqService {

    FaqDAO faqDAO;

    @Autowired
    public void setFaqDAO(FaqDAO faqDAO) {
        this.faqDAO = faqDAO;
    }

    @Override
    public List getAllFaqs() {
        return faqDAO.getAllFaqs();
    }
}
