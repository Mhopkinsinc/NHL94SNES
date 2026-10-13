; Bank $95, fourth 4 KB: the end of SmallLetterSprites, then DATA8_95B15C, a block for the sound CPU (upload lists
; DATA8_80E6C1 and DATA8_80DD16), then the start of DATA8_95BA96, LZ-packed tiles.

org $95B000
	incbin "../Extracted/data/SmallLetterSprites.spr":2057..2405
DATA8_95B15C:		; for SPCUploadBlock, as DATA8_958000
	db $09,$36
	db $09,$36
	incbin "../Extracted/data/DATA8_95B15C.spc":4..2362
DATA8_95BA96:		; tiles packed for DecompressLZ that screen setups in bank $9F send to VRAM; not identified yet
	db $10,$FB
	db $00,$0E,$A0
	incbin "../Extracted/data/DATA8_95BA96.chr.lz":5..1386
