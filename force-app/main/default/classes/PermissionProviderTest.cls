/**
 * Created by alexanderbelenov on 20.07.2022.
 */

@IsTest
private class PermissionProviderTest {

    @TestSetup static void setup() {
        TestUtil.saveTestStandardUser();
    }

    @IsTest static void testGetObjectFieldExists() {
        System.runAs(TestUtil.getTestUser()) {
            SObjectField field = PermissionProvider.getObjectField(new Contact(LastName='TestContact'), 'LastName');
            System.assertEquals(field.getDescribe().name, 'LastName');
        }
    }

    @IsTest static void testGetObjectFieldNotExists() {
        System.runAs(TestUtil.getTestUser()) {
            SObjectField field = PermissionProvider.getObjectField(new Contact(LastName='TestContact'), 'LastNameTest');
            System.assert(field == null);
        }
    }

    /*
    The test user's profile has Edit access for the Email field
     */
    @IsTest static void testIsCreateAccessiblePhone() {
        System.runAs(TestUtil.getTestUser()) {
            Boolean result = PermissionProvider.isCreateAccessible(Contact.Email);
            System.assert(result);
        }
    }

    /*
    The test user's profile doesn't have Edit access for the LastModifiedById, Phone fields
     */
    @IsTest static void testIsCreateAccessiblePhoneNoAccess() {
        System.runAs(TestUtil.getTestUser()) {
            Boolean resultLastModifiedById = PermissionProvider.isCreateAccessible(Contact.LastModifiedById);
            Boolean resultPhone = PermissionProvider.isCreateAccessible(Contact.Phone);
            System.assert(!resultLastModifiedById);
            System.assert(!resultPhone);
        }
    }

    /*
    The test user's profile has Read access for the Title field
     */
    @IsTest static void testIsReadAccessible() {
        System.runAs(TestUtil.getTestUser()) {
            Boolean result = PermissionProvider.isCreateAccessible(Contact.Title);
            System.assert(result);
        }
    }

    /*
    The test user's profile doesn't have Read access for the MobilePhone, Phone field
     */
    @IsTest static void testIsReadAccessibleNoAccess() {
        System.runAs(TestUtil.getTestUser()) {
            Boolean resultMobilePhone = PermissionProvider.isCreateAccessible(Contact.MobilePhone);
            Boolean resulPhone = PermissionProvider.isCreateAccessible(Contact.Phone);
            System.assert(!resultMobilePhone);
            System.assert(!resulPhone);
        }
    }
}