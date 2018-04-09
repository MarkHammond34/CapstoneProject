package edu.ben.service;

import edu.ben.dao.TutorialDAO;
import edu.ben.model.Tutorial;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TutorialServiceImpl implements TutorialService {

    private TutorialDAO tutorialDAO;

    @Autowired
    public void setTutorialDAO(TutorialDAO tutorialDAO) {
        this.tutorialDAO = tutorialDAO;
    }

    @Override
    public int save(Tutorial tutorial) {
        return tutorialDAO.save(tutorial);
    }

    @Override
    public void update(Tutorial tutorial) {
        tutorialDAO.update(tutorial);
    }
}
