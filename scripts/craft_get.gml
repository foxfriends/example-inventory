/* Script: craft_get(recipe, value);
argument0: recipe   -> The recipe to get the information from
argument1: value    -> The value to take from the recipe

Returns the requested information about the recipe
*/
var recipe = argument0;
if(ds_grid_value_exists(CraftingController.recipes, 0, CRAFTNAME, ds_grid_width(CraftingController.recipes) - 1, CRAFTNAME, recipe) || is_real(recipe)) {
    if(is_string(recipe)) {
        recipe = ds_grid_value_x(CraftingController.recipes, 0, CRAFTNAME, ds_grid_width(CraftingController.recipes) - 1, CRAFTNAME, recipe);
    }
    return ds_grid_get( CraftingController.recipes,
                        recipe,
                        argument1);
}
