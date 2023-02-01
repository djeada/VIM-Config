

## Navigation

| Command | Description |
| --- | --- |
| <i>h</i> | Move left |
| <i>j</i> | Move down |
| <i>k</i> | Move up |
| <i>l</i> | Move right |
| <i>H</i> | Top line on screen |
| <i>M</i> | Middle line on screen |
| <i>L</i> | Bottom line on screen |
| <i>10j</i> | Move down 10 lines |
| <i>gg</i> | First line of the file | 
| <i>G</i> | Last line of the file |
| <i>:20</i> | Line 20 of the file |
| <i>0</i> | Beginning of current line |
| <i>^</i> | First non-whitespace character of current line |
| <i>$</i> | End of current line |
| <i>e</i> | The end of the current word |
| <i>b</i> | Beginning of current word |
| <i>w</i> | Beginning of next word |
| <i>%</i> | Move to matching parenthesis, bracket or brace |

## Editing

| Command | Description |
| --- | --- |
| <i>i</i> | Insert before current character |
| <i>a</i> | Insert after current character |
| <i>I</i> | Insert at the first non-whitespace character of the line |
| <i>o</i> | Insert a line below the current line, then enter insert mode |
| <i>O</i> | Insert a line above the current line, then enter insert mode |
| <i>r</i> | Overwrite one character and return to command mode |

## Undo and redo

| Command | Description |
| --- | --- |
| <i>u</i> | undo |
| <i>ctrl + r</i> | redo |

## Search and replace

| Command | Description |
| --- | --- |
| <i>noh</i> | Get rid of Vim's highlight after searching text |
| <i>/pattern</i> | Search for pattern |
| <i>?pattern</i> | Search backward for pattern |
| <i>:%s/xxx/yyy/g</i> | Replace all occurrences of xxx in the file with yyy  |

## Mode switching

| Command | Description |
| --- | --- |
| <i>i</i> | Go into insert mode |
| <i>:</i> | Go into command mode |
| <i>R</i> | Go into replace mode |
| <i>v</i> | Go into visual mode |
| <i>esc</i> | Go into normal mode |

## Opening and closing files

| Command | Description |
| --- | --- |
| <i>e filename</i> | Edit a file |
| <i>w</i> | Save the current file |
| <i>wq</i> | Saves and closes the current file; exits vim if no open files are present |
| <i>w newname</i> | Continue editing the original file while saving a copy of the current file as ‘newname.' |
| <i>q!</i> | Close a file without saving |
| <i>x</i> | Write any changes to the file and close the file |

## Working with multiple files

| Command | Description |
| --- | --- |
| <i>tabe</i> | Create a new tab |
| <i>gt</i> | Go to next tab |
| <i>gT</i> | Go to previous tab |
| <i>vs[plit] file</i> | open a file in a new buffer and vertically split window |
| <i>sp[lit] file</i> | open a file in a new buffer and horizontally split window |
| <i>ctrl + w</i> | navigate to the next split |