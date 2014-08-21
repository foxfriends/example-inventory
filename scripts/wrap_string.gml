/** THIS SCRIPT WAS CREATED BY Ivaxlar FROM THE GMC - I take no credit
 * Inserts new lines <#> into a given string until its
 *     draw width is as specified.
 * 
 * argument0 The string to wrap.
 * argument1 The width in pixels to fit to.
 * 
 * returns The new string with inserted line breaks.
 */

var text, sub_str, draw_width, pivot, last_good, chunk_start;
text = argument0;
draw_width = argument1;
// the character to check, starting on the left
pivot = 1;
// the last space position inside the current chunk
last_good = 1;
// the first position inside the current chunk
chunk_start = 1;


// loop through the string until a space is found
while( string_width(text) > draw_width and
       pivot <= string_length(text) )
{
    // if the pivot is a space, then check for line break
    if( string_char_at(text, pivot) == " " or
        pivot == string_length(text) ) // last character in the string
    {
        // create next string chunk
        sub_str = string_copy( text, chunk_start, pivot - chunk_start );
        // check if chunk width is too wide
        if( string_width(sub_str) > draw_width )
        {
            // ~ insert a line break
            // delete the space
            text = string_delete( text, last_good, 1 );
            // insert the break
            text = string_insert( "#", text, last_good );
            
            // next chunk starts just after line break
            chunk_start = last_good + 1;
        }
        else // chunk width is fine
            last_good = pivot;
    }
    
    // go to the next character
    pivot += 1;
}

return text;

