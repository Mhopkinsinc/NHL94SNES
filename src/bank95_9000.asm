; Bank $95, second 4 KB: the end of DATA8_958ABD, then DATA8_959490, a block for the sound CPU (upload list
; DATA8_80DD16), then the start of DATA8_959E48, a block for the sound CPU (a long pointer list in bank $9C).

org $959000
	incbin "../Extracted/data/DATA8_958ABD.spc":1347..2515
DATA8_959490:		; for SPCUploadBlock, as DATA8_958000
	db $09,$B4
	db $09,$B4
	incbin "../Extracted/data/DATA8_959490.spc":4..2488
DATA8_959E48:		; for SPCUploadBlock, as DATA8_958000
	db $03,$F9
	db $09,$AB
	incbin "../Extracted/data/DATA8_959E48.spc":4..440
