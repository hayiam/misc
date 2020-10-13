/** Function to shift the current view to the left/right
 *
 * @param: "arg->i" stores the number of tags to shift right (positive value)
 *          or left (negative value)
 */
/* difining scratchtag here (was in dwm.c after #include "config.h" */

static unsigned int scratchtag = 1 << LENGTH(tags);

void
shiftview(const Arg *arg) {
	Arg shifted;
	
	if(selmon->tagset[selmon->seltags] &= ~scratchtag) {

	if(arg->i > 0) // left circular shift
		shifted.ui = (selmon->tagset[selmon->seltags] << arg->i)
		   | (selmon->tagset[selmon->seltags] >> (LENGTH(tags) - arg->i));

	else // right circular shift
		shifted.ui = selmon->tagset[selmon->seltags] >> (- arg->i)
		   | selmon->tagset[selmon->seltags] << (LENGTH(tags) + arg->i);

	view(&shifted);
}
}
