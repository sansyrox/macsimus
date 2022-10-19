# Macsimus Tutorials


'Space' key is the super key in Macsimus (to be used when not in any mode like insert or view)

## General Navigation

Normal Mode
1. j -> down
2. k -> up
3. h -> left
4. l -> right

## Navigation in Insert Mode

1. ctrl + j -> down
2. ctrl + k -> up
3. ctrl + h -> left
4. ctrl + l -> right
5. ctrl + e -> end of line
6. ctrl + w -> end of word
7. ctrl + b -> starting of word

## Word-wise Navigation Keys
 
1. b -> backwards for each word 
2. w -> start of the next word
3. e -> end of the current word

## Line-wise Navigation Keys

1. 0 -> zeroth character of the line
2. $ -> last character of the line
3. o -> downwards one line and enable insert mode
4. O -> upwards one line and enable insert mode

## Page-wise Navigation Keys 

1. gg -> first character of the page
2. G -> last line of the page
3. ctrl + u -> 50% of the page upwards
4. ctrl + d -> 50% of the page downwards

## Navigation According to Relational Line Numbering

To set relational line numbering, first exit all modes using 'esc' key. Then, type
:set rnu

1. 4K -> 4 units upwards
2. 4J -> 4 units downwards

## Undo-Redo Commands

1. u -> undo
2. ctrl + R -> redo


## Copy-paste Commands

1. V+j -> Copying line
2. y -> Copy (yank)
3. p -> paste 

## Important features

1. Open Explorer 
``` 
space + e
```
    1.1. Split Screen from Explorer
        v -> vertical split
        s -> horizontal split

2. Navigating Between Splits (Normal Mode) <br>
- ctrl + h -> towards left <br>
- ctrl + l -> towards right <br>
- ctrl + w -> press w to move alternatively among all splits in cw direction
- ctrl + w + directional key -> to move directly to a split

3. Closing Splits <br>
ctrl + q

4. Opening a Terminal <br>
```
space + t + ;
```

5. Opening a Python Shell <br>
```
space + t + p
```

6. Opening start screen
```
space + .
```

7. Commenting and Uncommenting a line
```
space + /
```
