; Bank $93, fourth 4 KB: the end of DATA8_93A18D, then the start of DATA8_93B217, packed linear background tiles of a
; screen with EA SPORTS.

org $93B000
	incbin "../Extracted/data/DATA8_93A18D.spc":3699..4234
DATA8_93B217:		; linear 4bpp background tiles packed for DecompressPairs: a screen with EA SPORTS
	db $46,$FB
	db $00,$2C,$E0
	incbin "../Extracted/data/DATA8_93B217.lin.pairs":5..3561
