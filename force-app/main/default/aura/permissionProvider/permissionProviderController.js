/**
 * Created by alexanderbelenov on 23.07.2022.
 */

({
    checkContactPermissions: function (component, event, helper) {
        const permission = component.get("v.permission");
        const fieldName = component.get("v.fieldName");
        helper.hasContactPermission(component, permission, fieldName);
    }
});