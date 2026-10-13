; Bank $92, second 4 KB: the end of DATA8_928000, then a second block for the sound CPU (see bank92_8000).

org $929000
	incbin "../Extracted/data/DATA8_928000.spc":4096..5107
DATA8_9293F3:		; for SPCUploadBlock, as DATA8_928000
	db $13,$C2
	db $13,$C2
	incbin "../Extracted/data/DATA8_9293F3.spc":4..3085
