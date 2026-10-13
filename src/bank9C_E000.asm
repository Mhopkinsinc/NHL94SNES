; Bank $9C, seventh 4 KB: the start of the screen text records that the menu and stats code prints (a length word,
; then the text with position codes); they continue in the next file. The team database before them is in
; src/data/teamdata94s.asm (included from bank9C_A000).

org $9CEF59
incsrc "data/text/DATA8_9CEF59.asm"
