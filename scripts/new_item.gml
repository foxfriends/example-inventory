/* Script: new_item(name, description, sell, buy, qty, sprite)
argument0 -> The name of the item               (string)
argument1 -> A description of the item          (string)
argument2 -> The sell value of the item         (real: -1 to be unsellable)
argument3 -> The buy price of the item          (real)
argument4 -> The maximum quantity of the item   (real: -1 for unlimited)
argument5 -> A sprite of the object             (real: sprite index)

Adds a new item to the item database. Returns true if all values are correct,
false otherwise. If the database is too small, it will make it bigger
*/
var name, description, sell, buy, qty, sprite, index;
name = argument0;
description = argument1;
sell = argument2;
buy = argument3;
qty = argument4;
sprite = argument5;
//If there are empty spaces left in the item database...
if(ds_grid_value_exists(itemDB, 0, ItemName, ds_grid_width(itemDB) - 1, ItemName, "")) {
    //... the index is the first empty space
    index = ds_grid_value_x(itemDB, 0, ItemName, ds_grid_width(itemDB) - 1, ItemName, "");
} else {
    //... set the index to the width and make it bigger
    index = ds_grid_width(itemDB);
    ds_grid_resize(itemDB, index + 1, 6);
}
//check to make sure all the given values are correct
if(is_string(name) && is_string(description) && is_real(sell) && is_real(buy) && is_real(qty) && sprite_exists(sprite)) {
    //If they are, then insert them into the database
    ds_grid_set(itemDB, index, ItemName, name);
    ds_grid_set(itemDB, index, ItemDesc, description);
    ds_grid_set(itemDB, index, ItemSell, sell);
    ds_grid_set(itemDB, index, ItemBuy, buy);
    ds_grid_set(itemDB, index, ItemMax, qty);
    ds_grid_set(itemDB, index, ItemSprite, sprite);
    return true;
} else return false;
