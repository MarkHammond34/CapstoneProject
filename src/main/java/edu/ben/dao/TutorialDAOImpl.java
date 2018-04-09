package edu.ben.dao;

import edu.ben.model.Tutorial;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Transactional
@Repository
public class TutorialDAOImpl implements TutorialDAO {

    @Override
    public int save(Tutorial tutorial) {
        return 0;
    }

    @Override
    public void update(Tutorial tutorial) {

    }
}
