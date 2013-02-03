URxvt patchs
============
Here is some patchs for [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode) :


`rxvt-unicode_cursorstyle.patch`
--------------------------------

### Why this patch ?

Normally rxvt cursor is just a special way of rendering the character at its position. When
the cursor is "block" the "reverse video" attribute is temporally set to the cell and when
it's underline, it's the underline attribute.

The first drawbacks is a limitation of cursor shapes by normal characters attributes. To
take a practical example you can't have a "vertical bar" cursor as a "vertical bar"
character attribute doesn't makes any sens.

The second drawback is that using character attributes to render a cursor doesn't make it
distinguishable when the curso is on a character that actually hold such attribute. This
is specially true using a steady underline cursor on an underlined text...

### This patch features

The point of this patch is to add a cursor which have style on its own. Current features
are :

  * An Underline cursor which is now 2 pixels height so you'll see it even on underline
    text. It's not big revolution, as it looks now the same as other terms (ex. XTerm).

  * A "vertical bar" cursor pretty useful for text editing (ex. VIM in Insert mode).

  * In order to make such cursor available dynamically, I also added Support for
    DECSCUSR/VT520 escape sequences. This allow you to change cursor shape AND cursor
    blinking state (if enable, see ./configure --help | grep blink).

   * `echo -en "\033[0 q"` - Blinking block cursor
   * `echo -en "\033[1 q"` - Blinking block cursor
   * `echo -en "\033[2 q"` - Steady block cursor
   * `echo -en "\033[3 q"` - Blinking underline cursor
   * `echo -en "\033[4 q"` - Steady underline cursor
   * `echo -en "\033[5 q"` - Blinking vertical bar cursor
   * `echo -en "\033[6 q"` - Steady vertical bar cursor

### History

  - 28/01/2013 - Initial release
  - 02/01/2013 - Clean up
  - 04/01/2013 - Fix with last cvs commits

`rxvt-unicode_styles.patch'
---------------------------

### Disclaimer

  This patch is experimental and is more a bunch of ideas and a proof of concepts that a
  production thing.

### Why this patch ?

  This patch try to improve the way character attributes are rendered (ex. Underline
  position) and add new rendering (ex. Undercurl).

### Features

* Add a new setting to define underline offset useful when the underline is stuck too
  close to the characters.
    URxvt.underlinePosition: number

  Note: this is far from a good solution. In URxvt the underline is not handled by XFT
  but with a simple line drawing which is not make real use of fonts metrics. Normally
  this setting should disappear by fixing this issue.

* Add a news setting to define underline color by fading it to background with a
  specified percentage.
    URxvt.underlineFade: 50̀

  Target is to make underline easier to especially on dark backgrounds.

* Add a new "undercurl" rendering style for characters. Undercurl are little waves
  underlining a word generally used to signify spelling mistakes.

  This undercurl can be set by a "new" SGR mode 10 :
    echo -ne "\033[10mThis is undercurl\033[m"

  This is experimental and it's not using a new rendering bit. Internally the SGR
  mode is BLINK+UNDERLINE. As blinking text is not very useful, this is quite acceptable to
  choose between Blink text or extended styles like undercurl.

  So to have this patch working you must disable text blinking :
    ./configure --disable-text-blink

  This way BLINK is used as a multiplexing bit allowing more styles like strikeout for
  example (later ;-).

  If you use the `vim-term-undercurl.patch` you'll be able to use this with Vim, for
  example to undercurl spell mistakes.
      :set t_Cs=^[[10m

  As for underline you can set `undercurlColor`, `undercurlPosition` and `undercurlFade`.

  An other setting is `undercurlStoleColor: true|false` instructing URxvt to use the
  character color for the underline and use the plain foreground color for the character.
  This way if you render a red, undercurled, text, it will appear as a normal text with
  red undercurl.

  Notice that this is a proof of concept (undercurl in term). If this looks useful (you
  tell me ;-) it would be far better to :
    - Add an "underline style" set of bits for each character allowing us to have
      undercurl, but also double underline, stroke text, etc...

    - Add a set of buts for each characters allowing to define the underline (or whatever
      underline style defines) color.

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


