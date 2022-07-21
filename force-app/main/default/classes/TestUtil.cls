/**
 * Created by alexanderbelenov on 20.07.2022.
 */

@IsTest
public class TestUtil {
    private static final String TEST_USER_LAST_NAME = 'Testing';
    private static final String TEST_USER_EMAIL = 'tuser@playful-unicorn-s6kepg-dev-ed.lightning.force.com';
    public static final String TEST_USER_USERNAME = 'tuser@playful-unicorn-s6kepg-dev-ed.lightning.force.comuser';
    public static final String TEST_USER_PROFILE = 'Custom Standard User';
    public static final String TEST_USER_ALIAS = 'testuser';

    public static User saveTestStandardUser() {
        Profile prof = [
                SELECT Id
                FROM Profile
                WHERE Name=:TEST_USER_PROFILE
        ];

        User usr = new User(
                Alias = TEST_USER_ALIAS,
                Email = TEST_USER_EMAIL,
                UserName = TEST_USER_USERNAME,
                ProfileId = prof.Id,
                EmailEncodingKey='UTF-8',
                LastName=TEST_USER_LAST_NAME,
                LanguageLocaleKey='en_US',
                LocaleSidKey='en_US',
                TimeZoneSidKey='America/Los_Angeles'
        );
        insert usr;

        return usr;
    }

    public static User getTestUser() {
        User usr = [
                SELECT Id
                FROM User
                WHERE Username = :TEST_USER_USERNAME
        ];
        return usr;
    }
}