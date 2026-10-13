; Bank $91, fifth 4 KB: the end of the sprite set DATA8_91B188, then a block for the sound CPU from the upload list
; DATA8_80DD16 in bank80_D000.

org $91C000
	incbin "../Extracted/data/DATA8_91B188.spr.huf":3704..5662
	db $00
DATA8_91C7A7:		; for SPCUploadBlock, as DATA8_918000
	db $00,$1B
	db $16,$02
	incbin "../Extracted/data/DATA8_91C7A7.spc":4..2137
