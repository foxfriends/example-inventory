/* Script: craft_get(recipe, value);
argument0: recipe   -> The recipe to get the information from
argument1: value    -> The value to take from the recipe

Returns the requested information about the recipe
*/
if(ds_grid_value_exists(CraftingController.recipes, CRAFTNAME, 0, CRAFTNAME, ds_grid_height(CraftingController.recipes), argument0)) {
    return ds_grid_get( CraftingController.recipes,
                        ds_grid_value_x(CraftingController.recipes, CRAFTNAME, 0, CRAFTNAME, ds_grid_height(CraftingController.recipes), argument0),
                        argument1);
}
