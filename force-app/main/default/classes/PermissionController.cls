/**
 * Created by alexanderbelenov on 24.07.2022.
 */

public with sharing class PermissionController {

    @AuraEnabled
    public static Boolean hasAccountPermissions(String operation, String fieldName) {
        Boolean result = false;
        try {
            result = PermissionService.hasAccountPermissions(operation, fieldName);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return result;
    }

}