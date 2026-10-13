; Bank $92, fourth 4 KB: the end of LetterSprites, then a block for the sound CPU from the upload lists in
; bank80_E000.

org $92B000
	incbin "../Extracted/data/LetterSprites.spr":2119..5032
DATA8_92BB61:		; for SPCUploadBlock, as DATA8_928000
	db $13,$68
	db $13,$68
	incbin "../Extracted/data/DATA8_92BB61.spc":4..1183
