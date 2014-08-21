/* Script: inv_init();
Creates the item database, containing all of the items, their buy/sell values,
a description, and the maximum quantity.

Also creates the inventory, storing the item index and the owned quantity.
*/

//Make the grids global so that they can be used again later. Also declare the variable for the shop grid
globalvar itemDB, inv, shop;
itemDB = ds_grid_create(0,0);  //Create the database
ds_grid_set_region(itemDB, 0, ItemName, ds_grid_width(itemDB) - 1, ItemName, "");
//Add new items to the item database
new_item(   "Apple",                                            //Name 
            "It's an apple. You can eat it to heal 10 health",  //Description
            3,                                                  //Sell price
            5,                                                  //Buy price
            10,                                                 //Maximum quantity
            spr_apple);                                         //Sprite
new_item(   "Sword", 
            "A viscious blade, able to easily slice through anything",
            -1,                 //You can never sell the sword
            175,
            1,                  //Only ever get 1 sword
            spr_sword);
new_item(   "Diamond",
            "A beautiful diamond",
            100,
            500,
            -1,                 //Unlimited diamonds
            spr_diamond);
new_item(   "Rock",
            "Why would I ever need a rock?",
            1,
            4,
            -1,
            spr_rock);
new_item(   "Bomb",
            "This bomb can blow a huge hole in almost anything!",
            20,
            35,
            15,
            spr_bomb);
new_item(   "Dynamite",
            "This pack of thin explosives is even more powerful than a bomb",
            25,
            45,
            10,
            spr_dynamite);
new_item(   "Detonator",
            "I can use this to set off Dynamite safely",
            5,
            10,
            10,
            spr_detonator);
new_item(   "Burger",
            "A hamburger will heal you 30 health, but you'll get fat if you eat too many",
            9,
            15,
            10,
            spr_burger);
new_item(   "Chocolate",
            "MMMM... I love chocolate. Heals 15 health when eaten",
            5,
            7,
            10,
            spr_chocolate);
new_item(   "Key",
            "I wonder what this key opens",
            15,
            30,
            -1,
            spr_key);
//Add more for more items... Don't forget to raise the width of the grid if you go over
var invWidth, invHeight;
invWidth = 20;      //Maximum number of slots in the the inventory
invHeight = 2;      //Number of values for each item
inv = ds_grid_create(invWidth, invHeight);    //Create the inventory

//Set the inventory to be empty
ds_grid_set_region(inv, 0, ItemIndex, ds_grid_width(inv) - 1, ItemIndex,-1);       
ds_grid_set_region(inv, 0, ItemQty, ds_grid_width(inv) - 1, ItemQty,0);

//Set the initial amount of money
score = 30;
