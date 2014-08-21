/* Script: craft_draw_menu();

Draw the crafting menu - a list of all unlocked recipes.
The selected one is highlighted.
*/
for(var i = 0; i < ds_grid_width(recipes); i++) {
    if(craft_get(i, CRAFTABLE)) {
        draw_text(32, 32 + string_height("A") * numDrawn, craft_get(i, CRAFTNAME));
        numDrawn++;
    }
}
