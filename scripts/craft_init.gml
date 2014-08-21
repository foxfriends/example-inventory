/* Script: craft_init()

A crafting system, compatible with the inventory system.
A ds_grid holds the item name, the materials/ingredients
in a comma separated string (material=quantity,material=quantity,...),
and the time it takes to make (in seconds).
A list of projects holds the items the player asked to make
*/
recipes = ds_grid_create(0, 4);
craft_recipe("Sword", "Wood=3", 5);
craft_recipe("Bow", "Wood=3,String=1", 5);
craft_recipe("Pie", "Apple=1,Dough=1", 5);
projects = ds_list_create();
timer = 0;
menuVisible = false;
currentOption = 0;
