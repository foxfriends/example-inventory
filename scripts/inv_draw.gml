/* Script: inv_draw();

Draws every item in the inventory in a grid. 
*/
var discardMessage, slot, row, boxX = 0, boxY = 0, item, str, name, desc, i, itemsPerRow = 10;
//Use the custom font for writing
draw_set_font(fDialog);
//Draw a rectangle for the background. This is used to hide the deactivated instances behind
draw_set_color(make_color_rgb(100,40,40));
draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
//Draw a message at the top
draw_set_color(c_ltgray);
//Set the discard message
discardMessage = "Press <D> to drop it";
draw_text(5, 5, "Press <space> to use an item#" + discardMessage);
//Draw the inventory items
for(var i = 0; i < 11; i++) {
    draw_line(16 + ITEMW * i, 100, 16 + ITEMW * i, 100 + ITEMH * 10)
    draw_line(16, 100 + ITEMH * i, 16 + 10 * ITEMW, 100 + ITEMH * i)
}
for(slot = 0; slot < ds_grid_width(inv); slot += 1) {
    row = slot div itemsPerRow;
    boxY = row * ITEMH;
    //Check to see that there are still items in the inventory
    //Check if the current item is the selected item and highlight it
    if(curItem == slot) {
        draw_set_color(c_red);
        //Draw the square
        draw_rectangle(16 + boxX, 100 + boxY, 16 + boxX + ITEMW, 100 + boxY + ITEMH, true);
    } else {
        draw_set_color(c_ltgray);
    }
    //Draw the empty squares
    //Draw the box
    if(inv_read(slot, ITEMQTY) > 0) {
        //Draw the sprite
        draw_sprite(inv_itemdb(inv_read(slot, ITEMINDEX), ITEMSPRITE), 0, boxX + 16, boxY + 100);
        //Reset the colour before looping again or exiting loop, and drawing quantity
        draw_set_color(c_black);
        draw_text(boxX + 16, boxY + 100, string(inv_read(slot, ITEMQTY)));
    }
    //Increment positions
    boxX = (boxX + (ITEMW)) % (itemsPerRow * ITEMW);
}

//Draw some instructions
str = "Press <X> to close";
draw_text(room_width - string_width(str) - 5, room_height - string_height(str) - 5, str);
if(inv_read(curItem, ITEMQTY) > 0) {
    //Draw some information about the item if there are items
    //Get the selected item and draw it's name and description
    item = inv_read(curItem, ITEMINDEX);
    name = inv_itemdb(item, ITEMNAME);
    desc = inv_itemdb(item, ITEMDESC);
    class = inv_itemdb(item, ITEMCLASS);
    str = desc;
    str = dialog_wrap(str, window_get_width() - 48 - ITEMW * 10);
    draw_text(32 + ITEMW * 10, 100, "Item: " + name + "#Type: " + class + "#" + str);
}
