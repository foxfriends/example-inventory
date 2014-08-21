/* Script: craft_queue(recipe);
argument0: recipe   -> The item to craft

Checks the materials needed, then adds the project to the queue
if there are enough. Returns true on success, false on failure.
*/
var recipe = argument0;
if(ds_grid_value_x(CraftingController.recipes, CRAFTNAME, 0, CRAFTNAME, ds_grid_height(CraftingController.recipes), recipe)) {
    //Split materials into an array
    var matstr = craft_get(recipe, CRAFTMATS), matsCount = 0, i, mats;
    while(matstr != "") {
        show_message(matstr);
        mats[matsCount, 0] = string_copy(matstr, 1, string_pos("=", matstr) - 1);
        matstr = string_copy(matstr, string_pos("=", matstr) + 1, string_length(matstr));
        mats[matsCount, 1] = real(string_copy(matstr, 1, string_pos(",", matstr) - 1));
        var pos = string_pos(",", matstr) + 1;
        if(pos == 1) {
            pos = string_length(matstr);
        }
        matstr = string_copy(matstr, pos, string_length(matstr));
        matsCount++;
        show_message(string(mats[matsCount, 0]) + " " + string(mats[matsCount, 1]));
    }
    //Check quantity of every material
    for(i = 0; i < matsCount; i++) {
        if(inv_has(mats[i, 0])) {
            if(inv_read(mats[i, 0], ITEMQTY) < mats[i, 1]) {
                break;
            }
        }
    }
    //If it worked
    if(i == matsCount) {
        //Add to queue
        ds_queue_enqueue(CraftingController.projects, recipe);
        //Remove materials
        for(i = 0; i < matsCount; i++) {
            inv_subtract(mats[i, 0], mats[i, 1]);
        }
    } else {
        return false;
    }
}
