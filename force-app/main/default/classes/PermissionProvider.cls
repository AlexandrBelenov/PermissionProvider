/**
 * Created by alexanderbelenov on 19.07.2022.
 */

public interface PermissionProvider {
    Set<String> isReadAccessible(List<String> fields);
    Set<String> isEditAccessible(List<String> fields);
    Set<String> isFilterable(List<String> fields);
}