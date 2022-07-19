/**
 * Created by alexanderbelenov on 19.07.2022.
 */

public class PermissionProvider {
    public static Boolean isCreateAccessible(String field) {
        return false;
    }
    public static Boolean isCreateAccessible(Schema.SObjectField field) {
        return (field != null)? field.getDescribe().isCreateable() : false;
    }
    public static Boolean isReadAccessible(String field) {
        return false;
    }
    public static Boolean isReadAccessible(Schema.SObjectField field) {
        return (field != null)? field.getDescribe().isAccessible() : false;
    }
    public static Boolean isEditAccessible(String field) {
        return false;
    }
    public static Boolean isEditAccessible(Schema.SObjectField field) {
        return (field != null)? field.getDescribe().isUpdateable() : false;
    }
    public static Boolean isFilterable(String field) {
        return false;
    }
    public static Boolean isFilterable(Schema.SObjectField field) {
        return (field != null)? field.getDescribe().isFilterable() : false;
    }
}