/* Script: craft_draw_menu();

Draw the crafting menu - a list of all unlocked recipes.
The selected one is highlighted.
*/
var numDrawn = 0;
draw_set_color(c_black);
draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
for(var i = 0; i < ds_grid_width(recipes); i++) {
    if(craft_get(i, CRAFTABLE)) {
        if(numDrawn == currentOption) {
            draw_set_color(c_green);
        } else {
            draw_set_color(c_white);
        }
        draw_text(32, 32 + string_height("A") * numDrawn, craft_get(i, CRAFTNAME));
        numDrawn++;
    }
}
