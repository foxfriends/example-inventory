/* Script: invdb_read(index, value)
argument0 -> The item index (Real: between 0 and the width of the item database OR String: the item name)
argument1 -> The value to read from the database (Real: ItemName (0), ItemDesc (1), ItemBuy (2), ItemSell(3) or ItemMax(4))

This script returns the requested value about the given item from the item database
*/
index = argument0;
if(is_string(index)) {
    index = ds_grid_value_x(itemDB, 0, ItemName, ds_grid_width(itemDB) - 1, ItemName, index);
}
return ds_grid_get(itemDB, index, argument1);
