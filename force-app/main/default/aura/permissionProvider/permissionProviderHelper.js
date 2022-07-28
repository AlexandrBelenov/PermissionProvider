/**
 * Created by alexanderbelenov on 23.07.2022.
 */

({
    hasContactPermission: function (component, permission, fieldName) {
        let action = component.get('c.hasContactPermissions');
        action.setParams({
            'permission': permission,
            'fieldName': fieldName,
        });
        action.setCallback(this, function(response) {
            const state = response.getState();
            if (state === "SUCCESS") {
                const data = response.getReturnValue();
                component.set('v.permissionResult', data);
            } else if (state === "ERROR") {
                const errors = response.getError();
                if (errors) {
                    for (let error of errors) {
                        console.log(error);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    }
});