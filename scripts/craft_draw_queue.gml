/* Script: craft_draw_queue()
Draws the queue of items to be crafted at the top of the
screen using the images from the inventory system.
*/
for(var i = 0; i < ds_list_size(CraftingController.projects); i++) {
    draw_sprite(inv_itemdb(ds_list_find_value(CraftingController.projects, i), ITEMSPRITE), 0, i * ITEMW, 0);
}
