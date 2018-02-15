package edu.ben.dao;

import edu.ben.model.FaqAnswer;
import edu.ben.model.FaqQuestion;

import java.util.List;

public interface FaqQuestionDAO {

    public List getAllQuestions();

    public void saveQuestion(FaqQuestion q);

    public void saveAnswer(FaqAnswer a);

    public void updateQuestion(FaqQuestion q);

    public void updateAnswer(FaqAnswer a);
}
