# VIM Cheat Sheet

## Basic Movement

| Command | Description |
| --- | --- |
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `gg` | First line of the file | 
| `G` | Last line of the file |
| `:20` | Line 20 of the file |
| `H` | Top line on screen |
| `M` | Middle line on screen |
| `L` | Bottom line on screen |
| `10j` | Move down 10 lines |
| `0` | Beginning of current line |
| `^` | First non-whitespace character of current line |
| `$` | End of current line |

## Insert Mode

| Command | Description |
| --- | --- |
| `i` | Insert before the cursor |
| `I` | Insert at the beginning of the line |
| `a` | Insert after the cursor |
| `A/i> | Insert at the end of the line |
| `o` | Insert a new line below the current line |
| `O` | Insert a new line above the current line |
| `Esc` | Exit insert mode |

## Editing

| Command | Description |
| --- | --- |
| `x` | Delete character under cursor |
| `dd` | Redelete current linedo |
| `dw` | Delete word from cursor to end of word |
| `D` | Delete from cursor to end of line |
| `u` | Undo last change |
| `Ctrl + r` | Redo |
  
## Visual Mode

| Command | Description |
| --- | --- |
| `noh` | Get rid of Vim's highlight after searching text |
| `v` | Start visual mode to select characters |
| `V` | Start visual mode to select lines |
| `o` | Move to other end of selection  |
| `d` | Delete selection |

## Cut, Copy and Paste

| Command | Description |
| --- | --- |
| `yy` | Copy current line |
| `yw` | Copy word from cursor to end of word |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
  
## Search and Replace

| Command | Description |
| --- | --- |
| `/` | Search forward for a pattern |
| `?` | Search backward for a pattern |
| `n` | Go to next occurrence |
| `N` | Go to previous occurrence |
| `:%s/old/new/g` | Replace all occurrences of "old" with "new" in the whole file |
  
## Saving and Quitting

| Command | Description |
| --- | --- |
| `w` | Write (save) the file |
| `wq` | Write (save) and quit VIM |
| `q/i> | Quit VIM |
| `q!` | Force quit VIM without saving |

## Working with multiple files

| Command | Description |
| --- | --- |
| `tabe` | Create a new tab |
| `gt` | Go to next tab |
| `gT` | Go to previous tab |
| `vs[plit] file` | Open a file in a new buffer and vertically split window |
| `sp[lit] file` | Open a file in a new buffer and horizontally split window |
| `Ctrl + w` | Navigate to the next split |
