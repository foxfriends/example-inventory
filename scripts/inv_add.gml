/* Script: inv_add(item, amt);
argument0 -> item name (string: name of item OR real: index of item)
argument1 -> quantity (real: number of items to get)

If the inventory has space, the script adds one 
to the quantity and returns true. It will add the item index
to the inventory if it is not already there. Returns false
if there isn't enough space or the item does not exist.
*/

var item, amt;
item = argument0;
if(is_string(item)) {
    //Get the index if the item given is a string
    item = item_get_index(index);
}
amt = argument1;

//Make sure the item exists before doing anything else
if(item > -1 && item < ds_grid_width(itemDB)) {    
    var slot;
    if(ds_grid_value_exists(inv, 0, 0, ds_grid_width(inv), 0, item)) {
        //Slot is either the place where the item is already being stored...
        slot = ds_grid_value_x(inv, 0, 0, ds_grid_width(inv), 0, item);
    } else if(ds_grid_value_exists(inv, 0, 0, ds_grid_width(inv), 0, -1)) {
        //... or the first empty space if the item is not already in the inventory
        slot = ds_grid_value_x(inv, 0, 0, ds_grid_width(inv), 0, -1);
    } else {
        //Return false and end script if the inventory is full
        return false;
        exit;
    }
    //If the current quantity is less than the maximum quantity
    if(inv_read(slot, ItemQty) < itemdb_read(item, ItemMax) || itemdb_read(item, ItemMax) == -1) {
        //Set the index
        ds_grid_set(inv, slot, ItemIndex, item);
        //And add the amount to the quantity
        ds_grid_add(inv, slot, ItemQty, amt);
        return true;
    } else return false;    //if the maximum was reached
} else return false;        //if the item does not exist
