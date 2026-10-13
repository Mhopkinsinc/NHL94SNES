; Bank $9C, last 4 KB: the rest of the screen text records (see bank9C_E000), then $FF fill.

org $9CF000
incsrc "data/text/DATA8_9CF000.asm"
	padbyte $FF
	pad $9D8000
