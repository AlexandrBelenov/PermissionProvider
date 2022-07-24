/**
 * Created by alexanderbelenov on 24.07.2022.
 */

public with sharing class PermissionService {
    public static Boolean hasContactPermissions(String permission, String fieldName) {
        Contact cont = new Contact(LastName='LastName');
        if (permission == Constants.PERMISSION_CREATE) {
            return PermissionProvider.isCreateAccessible(cont, fieldName);
        } else if (permission == Constants.PERMISSION_EDIT) {
            return PermissionProvider.isEditAccessible(cont, fieldName);
        } else if (permission == Constants.PERMISSION_READ) {
            return PermissionProvider.isReadAccessible(cont, fieldName);
        } else if (permission == Constants.PERMISSION_FILTERABLE) {
            return PermissionProvider.isFilterable(cont, fieldName);
        } else {
            return false;
        }
    }
}