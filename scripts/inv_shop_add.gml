/* Script: inv_shop_add(item)
argument0 -> The item to add to the shop (string: item name OR real: item index)
Adds an item to the shop's stock by adding it's index to the shop's
grid. Returns true on success, false if the item does not exist.
*/
item = argument0;
if(is_string(item)) {
    item = ds_grid_value_x(itemDB, 0, ITEMNAME, ds_grid_width(itemDB) - 1, ITEMNAME, item);
}
if(item < ds_grid_width(itemDB)) {
    //If there are empty spaces left in the shop...
    if(ds_grid_value_exists(shop, 0, ITEMNAME, ds_grid_width(shop) - 1, ITEMNAME, "")) {
        //... the index is the first empty space
        index = ds_grid_value_x(shop, 0, ITEMNAME, ds_grid_width(shop) - 1, ITEMNAME, "");
    } else {
        //... set the index to the width and make it bigger
        index = ds_grid_width(shop);
        ds_grid_resize(shop, index + 1, 6);
    }
    ds_grid_set(shop, index, 0, item);
    return true;
} else return false;
