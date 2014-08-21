/* Script: item_sell(slot, amt)
argument0 -> The slot to sell from (real: 0 to last slot in inventory)
argument1 -> The amount to sell (real: positive integer)

Removes the given amount from the quantity of the item in the specified slot
if the item is sellable and the item is in the inventory, then adds the value
to the money variable. Returns true if the item was successfully sold, and
false if the item is unsellable, there was no item in the slot or the slot 
did not exist.
*/
var slot, amt;
slot = argument0;
amt = argument1;

//If the slot exists
if(slot > -1 && slot < ds_grid_width(inv)) {
    var qty, value;
    //Find how many of the item the player owns
    qty = inv_read(slot, ItemQty);
    //Get the value of the item being sold
    value = itemdb_read(inv_read(slot, ItemIndex), ItemSell);
    //If there are items in the slot
    if(qty) {
        //If the item is sellable
        if(value > -1) {
            //If there are less items in the slot than you are trying to sell...
            if(amt > qty) {
                //... lower the amount you are trying to sell
                amt -= qty;
            }
            //If the item was successfully removed
            if(inv_subtract(slot, amt)) {
                //Adds the sell value to score. Change this if you are using your own money variable
                score += amt * value;
                return true;
            } else return false;//If the item was not removed
        } else return false;    //If the item is not sellable
    } else return false;        //If there was none of the item
} else return false;            //If the slot did not exist
