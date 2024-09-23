# Nvim Shit

## Motions
### Change List
g; - go to older position in change list
g, - go to newer position in change list

### Marks
m{a-z} - Create mark 
`{a-z} - Go to exact mark location
'{a-z} - Go to first non-blank character in mark

### Horizontal Movement
ge - Go to end of word backwards
gE - Go backward to end of whitespace word backwards
^ - Go to start of line
$ - Go to end of line

### Vertical Movement
H - Go to top of window
M - Go to middle of window
L - Go to bottom of window

### Objects
( - Move backward between sentences
) - Move forward between sentences
{ - Move backward between paragraphs
} - Move forward between paragraphs
[[ - Move backward between sections
]] - Move forward between sections
[* - Move to end of previous comment
]* - Move to end of next comment

### Bodies
]m, ]M - Go to next start or end of a method
[m, [M - Go to previous start or end of a method

### Various
[( - Go to previous unmatched '('
[) - Go to previous unmatched ')'
[{ - Go to previous unmatched '{'
[} - Go to previous unmatched '}'

### Selections
af - Function outer
if - Function inner
ac - Class outer
ic - Class inner

### Searching
* - Search for word under cursor

### Parameters
<leader>rx - Swap next parameter
<leader>rX - Swap previous parameter


## LSP
<leader>df - Peek function defintion
gd - Goto definition
gr - Goto references
gI - Goto implementation
<leader>D - Type definition
<leader>ws - Workspace symbols search
<leader>lr
<leader>ca - Code action
K - Hover documentation

### Diagnostics
<leader>ld - Open diagnostics with trouble
[d - Previous diagnostic
]d - Next diagnostic
<leader>sd - Search diagnostics

**Other diagnostic**
<leader>q - Open diagnostics quickfix list
<leader>e - Show diagnostic error messages

