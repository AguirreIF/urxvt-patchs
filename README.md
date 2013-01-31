URxvt patchs
============
Here is some patchs for [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode) :

rxvt-unicode_decsusr.patch
--------------------------

This will allow you to modify existing cursor using DECSUSR sequence :

 * `echo -en "\033[0 q"` - Blinking block cursor
 * `echo -en "\033[1 q"` - Blinking block cursor
 * `echo -en "\033[2 q"` - Steady block cursor
 * `echo -en "\033[3 q"` - Blinking underline cursor
 * `echo -en "\033[4 q"` - Steady underline cursor
 * `echo -en "\033[5 q"` - No vertical bar, so fall back to Blinking block cursor
 * `echo -en "\033[6 q"` - No vertical bar, so fall back to Steady block cursor


rxvt-unicode_decsusr-cursorstyle.patch
--------------------------------------

Improve cursor in urxvt :
  * Modified underline cursor. It's now 2 pixels height so you'll see it even on underline
    text.
  * Added vertical bar cursor.

  * Support for DECSCUSR/VT520 escape sequences in order to handle cursor styles :
   * `echo -en "\033[0 q"` - Blinking block cursor
   * `echo -en "\033[1 q"` - Blinking block cursor
   * `echo -en "\033[2 q"` - Steady block cursor
   * `echo -en "\033[3 q"` - Blinking underline cursor
   * `echo -en "\033[4 q"` - Steady underline cursor
   * `echo -en "\033[5 q"` - Blinking vertical bar cursor
   * `echo -en "\033[6 q"` - Steady vertical bar cursor

Note: If you already applied decsusr.patch, use cursorstyle.patch


Vim Patchs
==========

vim-term-undercurl.patch
------------------------

  * Fix. allow to set t_Cs (undercurl start) and t_Ce (undercurl stop). This add a default
    "underline" behavior for t_Cs.

vim-term-managed.patch
----------------------

  * Ugly hack to send an ugly OSC when Vim leave mouse managed mode. More information (in
    french) here : http://dev.artisan.arnumeral.fr/creer-plugin-urxvt-sauvegarder-vim-automatiquement

