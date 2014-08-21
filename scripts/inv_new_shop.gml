/* Script: inv_new_shop();
Creates a new grid used to store all the items to be
sold by the shop. Returns the handle to the grid.
*/
var grid;
grid = ds_grid_create(1, 1);
ds_grid_set(grid, 0, 0, "");
return grid;
