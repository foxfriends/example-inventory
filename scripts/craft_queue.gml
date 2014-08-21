/* Script: craft_queue(recipe);
argument0: recipe   -> The item to craft

Checks the materials needed, then adds the project to the queue
if there are enough. Returns true on success, false on failure.
*/
var recipe = argument0;
if(ds_grid_value_exists(CraftingController.recipes, 0, CRAFTNAME, ds_grid_width(CraftingController.recipes) - 1, CRAFTNAME, recipe)) {
    //Split materials into an array
    var matstr = craft_get(recipe, CRAFTMATS), matsCount = 0, i, mats;
    while(matstr != "") {
        mats[matsCount, 0] = string_copy(matstr, 1, string_pos("=", matstr) - 1);
        matstr = string_copy(matstr, string_pos("=", matstr) + 1, string_length(matstr));
        //Pos is before the comma, or the end if the string if there isn't one
        var pos = string_pos(",", matstr) - 1;
        if(pos == -1) {
            pos = string_length(matstr);
        }
        mats[matsCount, 1] = real(string_copy(matstr, 1, pos));
        //Pos is after the comma, or the end if the string if there isn't one
        pos = string_pos(",", matstr) + 1;
        if(pos == 1) {
            pos = string_length(matstr) + 1;
        }
        matstr = string_copy(matstr, pos, string_length(matstr));
        matsCount++;
    }
    //Check quantity of every material
    for(i = 0; i < matsCount; i++) {
        if(inv_has(mats[i, 0]) != -1) {
            if(inv_read(inv_has(mats[i, 0]), ITEMQTY) < mats[i, 1]) {
                break;
            }
        } else {
            break;
        }
    }
    //If it worked
    if(i == matsCount) {
        //Add to queue
        ds_list_add(CraftingController.projects, recipe);
        //Remove materials
        for(i = 0; i < matsCount; i++) {
            inv_subtract(inv_has(mats[i, 0]), mats[i, 1]);
        }
        return true;
    } else {
        return false;
    }
} else {
    return false;
}
