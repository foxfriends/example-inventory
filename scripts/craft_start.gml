/* Script: craft_add(recipe);
argument0: recipe   -> The item to craft

Checks the materials needed, then adds the project to the queue
if there are enough.
*/
var recipe = argument0;
if(ds_grid_value_x(CraftingController.recipes, 0, 0, 0, 0, recipe)) {

}
