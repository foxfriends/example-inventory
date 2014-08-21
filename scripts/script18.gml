/* Script: craft_cancel();
Cancels the current project (first in the queue), and returns
all the materials.
*/

ds_queue_dequeue(CraftingController.projects);
