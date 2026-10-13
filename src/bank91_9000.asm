; Bank $91, second 4 KB: DATA8_918000 continued and a second block for the sound CPU (see bank91_8000).

org $919000
	incbin "../Extracted/data/DATA8_918000.spc":4096..6610
DATA8_9199D2:		; for SPCUploadBlock, as DATA8_918000
	db $17,$B2
	db $17,$B2
	incbin "../Extracted/data/DATA8_9199D2.spc":4..1582
