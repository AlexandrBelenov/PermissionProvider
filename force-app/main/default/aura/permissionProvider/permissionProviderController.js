/**
 * Created by alexanderbelenov on 23.07.2022.
 */

({
    checkContactPermissions: function (component, event, helper) {
        let permission = component.find("permission").get("v.value");
        let fieldName = component.find("fieldName").get("v.value");

        helper.hasContactPermission(component, permission, fieldName);
    }
});