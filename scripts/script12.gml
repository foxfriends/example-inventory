/* Script: craft_init()

A crafting system, compatible with the inventory system.
A ds_map holds the item name (key) and a comma separated list of
material=quantity as the value.
*/
recipes = ds_map_create();
craft_recipe("Wooden Sword", "Wood=3");
craft_recipe("Bow", "Wood=3,String=1");
