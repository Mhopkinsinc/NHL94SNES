; Bank $91, sixth 4 KB: the end of DATA8_91C7A7, then packed background tiles of an opening screen.

org $91D000
	incbin "../Extracted/data/DATA8_91C7A7.spc":2137..5638
DATA8_91DDAD:		; background tiles packed for DecompressLZ: an opening screen with EA SPORTS and ELECTRONIC ARTS
	db $10,$FB
	db $00,$28,$80
	incbin "../Extracted/data/DATA8_91DDAD.chr.lz":5..595
