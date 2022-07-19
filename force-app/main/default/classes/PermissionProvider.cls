/**
 * Created by alexanderbelenov on 19.07.2022.
 */

public class PermissionProvider {
    public static Boolean isCreateAccessible(SObject obj, String fieldName) {
        final SObjectField field = getObjectField(obj, fieldName);
        return isCreateAccessible(field);
    }
    public static Boolean isCreateAccessible(SObjectField field) {
        return (field != null)? field.getDescribe().isCreateable() : false;
    }
    public static Boolean isReadAccessible(SObject obj, String fieldName) {
        final SObjectField field = getObjectField(obj, fieldName);
        return isReadAccessible(field);
    }
    public static Boolean isReadAccessible(SObjectField field) {
        return (field != null)? field.getDescribe().isAccessible() : false;
    }
    public static Boolean isEditAccessible(SObject obj, String fieldName) {
        final SObjectField field = getObjectField(obj, fieldName);
        return isEditAccessible(field);
    }
    public static Boolean isEditAccessible(SObjectField field) {
        return (field != null)? field.getDescribe().isUpdateable() : false;
    }
    public static Boolean isFilterable(SObject obj, String fieldName) {
        final SObjectField field = getObjectField(obj, fieldName);
        return isFilterable(field);
    }
    public static Boolean isFilterable(SObjectField field) {
        return (field != null)? field.getDescribe().isFilterable() : false;
    }

    private static SObjectField getObjectField(SObject obj, String fieldName) {
        if (obj == null || String.isEmpty(fieldName)) {
            return null;
        }
        Map<String, SObjectField> fieldsMap = obj.getSObjectType().getDescribe().fields.getMap();
        return fieldsMap.get(fieldName);
    }
}