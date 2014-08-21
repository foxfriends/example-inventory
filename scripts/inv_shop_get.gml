/* Script: shop_get(slot)
argument0 -> The slot to get the item from (real: 0 to width of shop grid)
Get the index of the item in the shop grid at the slot
Returns the index on success, -1 if the slot did not exist
*/
var slot;
slot = argument0;
if(slot > -1 && slot < ds_grid_width(shop)) {
    return ds_grid_get(shop, slot, 0);
} else return -1;
