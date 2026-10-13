; Bank $92, fifth 4 KB: the end of DATA8_92BB61, then a block for the sound CPU from a long pointer list in bank $9C.

org $92C000
	incbin "../Extracted/data/DATA8_92BB61.spc":1183..4972
DATA8_92CECD:		; for SPCUploadBlock, as DATA8_928000
	db $00,$3F
	db $11,$82
	incbin "../Extracted/data/DATA8_92CECD.spc":4..307
