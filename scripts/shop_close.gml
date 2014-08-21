/* Script: shop_close()
Destroys the shop grid, freeing it from memory. Although it is not mandatory
to do this, it is a good idea. If the game involves opening various shops a
lot, they would take up a lot of memory.
*/
ds_grid_destroy(shop);
