/**
 * Created by alexanderbelenov on 20.07.2022.
 */

@IsTest
private class PermissionProviderTest {

    @TestSetup static void setup() {
        TestUtil.saveTestStandardUser();
    }

    @IsTest static void testGetObjectFieldExists() {
        System.runAs(TestUtil.fetchTestUser()) {
            SObjectField field = PermissionProvider.getObjectField(TestUtil.getTestContact(), 'LastName');
            System.assertEquals(field.getDescribe().name, 'LastName');
        }
    }

    @IsTest static void testGetObjectFieldNotExists() {
        System.runAs(TestUtil.fetchTestUser()) {
            SObjectField field = PermissionProvider.getObjectField(TestUtil.getTestContact(), 'LastNameTest');
            System.assert(field == null);
        }
    }

    @IsTest static void testGetObjectFieldNotExistsContact() {
        System.runAs(TestUtil.fetchTestUser()) {
            SObjectField field = PermissionProvider.getObjectField(null, 'LastName');
            System.assert(field == null);
        }
    }

    /*
    The test user's profile has Edit access for the Email field
     */
    @IsTest static void testIsCreateAccessible() {
        System.runAs(TestUtil.fetchTestUser()) {
            System.assert(PermissionProvider.isCreateAccessible(Contact.Email));
            System.assert(PermissionProvider.isCreateAccessible(TestUtil.getTestContact(), 'Email'));
        }
    }

    /*
    The test user's profile doesn't have Edit access for the LastModifiedById, Phone fields
     */
    @IsTest static void testIsCreateAccessiblePhoneNoAccess() {
        System.runAs(TestUtil.fetchTestUser()) {
            System.assert(!PermissionProvider.isCreateAccessible(Contact.LastModifiedById));
            System.assert(!PermissionProvider.isCreateAccessible(Contact.Phone));

            System.assert(!PermissionProvider.isCreateAccessible(TestUtil.getTestContact(), 'LastModifiedById'));
            System.assert(!PermissionProvider.isCreateAccessible(TestUtil.getTestContact(), 'Phone'));
        }
    }

    /*
    The test user's profile has Read access for the Title field
     */
    @IsTest static void testIsReadAccessible() {
        System.runAs(TestUtil.fetchTestUser()) {
            System.assert(PermissionProvider.isReadAccessible(Contact.Title));

            System.assert(PermissionProvider.isReadAccessible(TestUtil.getTestContact(), 'Title'));
        }
    }

    /*
    The test user's profile doesn't have Read access for the MobilePhone, Phone field
     */
    @IsTest static void testIsReadAccessibleNoAccess() {
        System.runAs(TestUtil.fetchTestUser()) {
            System.assert(!PermissionProvider.isReadAccessible(Contact.MobilePhone));
            System.assert(!PermissionProvider.isReadAccessible(Contact.Phone));

            System.assert(!PermissionProvider.isReadAccessible(TestUtil.getTestContact(), 'MobilePhone'));
            System.assert(!PermissionProvider.isReadAccessible(TestUtil.getTestContact(), 'Phone'));
        }
    }

    @IsTest static void testIsEditAccessible() {
        System.runAs(TestUtil.fetchTestUser()) {
            System.assert(PermissionProvider.isEditAccessible(Contact.Email));

            System.assert(PermissionProvider.isEditAccessible(TestUtil.getTestContact(), 'Email'));
        }
    }

    @IsTest static void testIsEditAccessibleNoAccess() {
        System.runAs(TestUtil.fetchTestUser()) {
            System.assert(!PermissionProvider.isEditAccessible(Contact.LastModifiedById));
            System.assert(!PermissionProvider.isEditAccessible(Contact.Phone));

            System.assert(!PermissionProvider.isEditAccessible(TestUtil.getTestContact(), 'LastModifiedById'));
            System.assert(!PermissionProvider.isEditAccessible(TestUtil.getTestContact(), 'Phone'));
        }
    }

    /*
    The Email field must be filterable, but the test user has no Edit and Read access to it
     */
    @IsTest static void testIsFilterable() {
        System.assertEquals(PermissionProvider.isFilterable(Contact.Email), true);

        System.assertEquals(PermissionProvider.isFilterable(TestUtil.getTestContact(), 'Email'), true);
    }
    /*
    The Description field is Long Text Area and user has the Edit and the Read access to it
     */
    @IsTest static void testIsFilterableFail() {
        System.assertEquals(PermissionProvider.isFilterable(Contact.Description), false);

        System.assertEquals(PermissionProvider.isFilterable(TestUtil.getTestContact(), 'Description'), false);
    }
}