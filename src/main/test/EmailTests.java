package test;

import edu.ben.util.Email;
import org.junit.Test;

public class EmailTests {



    @Test
    public void sendEmail() {
        Email.studentVerification("b2246523@ben.edu");
    }

}
