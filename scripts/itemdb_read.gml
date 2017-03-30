/* Script: invdb_read(index, value)
argument0 -> The item index (Real: between 0 and the width of the item database OR String: the item name)
argument1 -> The value to read from the database (Real: ItemName (0), ItemDesc (1), ItemBuy (2), ItemSell(3) or ItemMax(4))

This script returns the requested value about the given item from the item database, or noone if the value does not exist
*/
index = argument0;
if(is_string(index)) {
    index = item_get_index(index);
    if(index == noone) { return noone; }
}
return itemDB[# index, argument1]; // ds_grid_get(itemDB, index, argument1);
