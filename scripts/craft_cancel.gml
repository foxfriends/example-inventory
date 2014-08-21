/* Script: craft_cancel();
Cancels the current project (first in the queue), and returns
all the materials.
*/
var matstr = craft_get(ds_list_find_value(CraftingController.projects, 0), CRAFTMATS), mat, qty, matsCount = 0;
while(matstr != "") {
    //Add materials back
    mat = string_copy(matstr, 1, string_pos("=", matstr) - 1);
    matstr = string_copy(matstr, string_pos("=", matstr) + 1, string_length(matstr));
    //Pos is before the comma, or the end if the string if there isn't one
    var pos = string_pos(",", matstr) - 1;
    if(pos == -1) {
        pos = string_length(matstr);
    }
    qty = real(string_copy(matstr, 1, pos));
    //Pos is after the comma, or the end if the string if there isn't one
    pos = string_pos(",", matstr) + 1;
    if(pos == 1) {
        pos = string_length(matstr) + 1;
    }
    matstr = string_copy(matstr, pos, string_length(matstr));
    inv_add(mat, qty);
}
ds_list_delete(CraftingController.projects, 0);
