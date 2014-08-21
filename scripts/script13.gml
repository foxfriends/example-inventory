/* Script: craft_recipe(item, materials);
argument0: item         -> The item to craft
argument1: materials    -> A list of materials to be used: "material=qty,material=qty,...";

Adds a new item and recipe to the map
*/
if(is_string(argument0) && is_string(argument1)) {
    ds_map_add(recipes, argument0, argument1);
}
