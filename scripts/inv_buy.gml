/* Script: inv_buy(item, amt)
argument0 -> The item you are trying to buy (real: index of the item OR string: name of the item)
argument1 -> The amount of the item you are buying (real: positive integer)

If the inventory has space and the player has enough money,
they get the requested amount of the requested item, and the
price of the item is subtracted from the player's money.
If the item is successfully bought, it will return true,
false if the inventory is full or the player can't afford it.
*/
var item, amt;
item = argument0;
if(is_string(item)) {
    //Get the index if the item given is a string
    item = item_get_index(item);
}
amt = argument1;

//Make sure the item exists before doing anything else
if(item > -1 && item < ds_grid_width(itemDB)) {
    var price;
    price = amt * itemdb_read(item, ItemBuy);
    //If you have enough money to buy the item
    if(score >= price) {
        if(inv_add(item, amt)) {
            score -= price;
            return true;
        } else return false;//if the inventory was full
    } else return false;    //if the player can't afford it
} else return false;        //if the item does not exist
