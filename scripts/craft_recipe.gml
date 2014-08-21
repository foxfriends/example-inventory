/* Script: craft_recipe(item, materials);
argument0: item         -> The item to craft
argument1: materials    -> A list of materials to be used: "material=qty,material=qty,...";
argument2: time         -> The amount of time it takes to craft the item (in seconds)

Adds a new item and recipe to the map.
*/
if(is_string(argument0) && is_string(argument1) && is_real(argument2)) {
    ds_grid_resize(recipes, ds_grid_width(recipes) + 1, ds_grid_height(recipes));
    ds_grid_set(recipes, ds_grid_width(recipes) - 1, CRAFTNAME, argument0);
    ds_grid_set(recipes, ds_grid_width(recipes) - 1, CRAFTMATS, argument1);
    ds_grid_set(recipes, ds_grid_width(recipes) - 1, CRAFTTIME, argument2);
    ds_grid_set(recipes, ds_grid_width(recipes) - 1, CRAFTABLE, true);
}
