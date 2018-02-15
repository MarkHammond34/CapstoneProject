package edu.ben.service;

import edu.ben.dao.FaqQuestionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class FaqQuestionServiceImpl implements FaqQuestionService {

    FaqQuestionDAO faqQuestionDAO;

    @Autowired
    public void setFaqDAO(FaqQuestionDAO faqQuestionDAO) {
        this.faqQuestionDAO = faqQuestionDAO;
    }

    @Override
    public List getAllQuestions() {
        return faqQuestionDAO.getAllQuestions();
    }
}
