/**
 * Created by alexanderbelenov on 19.07.2022.
 */

public with sharing class ContactPermissionProvider implements PermissionProvider {

    public Set<String> isReadAccessible(List<String> fields) {
        return null;
    }

    public Set<String> isEditAccessible(List<String> fields) {
        return null;
    }

    public Set<String> isFilterable(List<String> fields) {
        return null;
    }
}