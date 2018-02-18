package edu.ben.service;

import edu.ben.dao.FaqDAO;
import edu.ben.dao.FavoriteDAO;
import edu.ben.model.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class FaqServiceImpl implements FaqService {

    FaqDAO fd;

    @Autowired
    public void setFaqDAO(FaqDAO fd) {
        this.fd = fd;
    }

    @Override
    public void save(Faq faq) {
        fd.save(faq);
    }

    @Override
    public List getAllFaqs() {
        return fd.getAllFaqs();
    }
}
