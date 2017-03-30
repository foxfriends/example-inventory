/// item_get_name(name);
/*
    Finds the index of the item with the name that is given. Returns noone if the item doesn't exist
*/
var name = argument0;
if(is_string(name)) {
    if(ds_grid_value_exists(itemDB, 0, ItemName, ds_grid_width(itemDB) - 1, ItemName, name)) {
        return ds_grid_value_x(itemDB, 0, ItemName, ds_grid_width(itemDB) - 1, ItemName, name);
    } else {
        return noone;
    }
} else {
    return name;
}
