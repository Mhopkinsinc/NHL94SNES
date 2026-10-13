; Bank $94, third 4 KB: the end of DATA8_949A00, then the start of DATA8_94A662, a block for the sound CPU (a long
; pointer list in bank $9C).

org $94A000
	incbin "../Extracted/data/DATA8_949A00.lz":1536..3170
DATA8_94A662:		; for SPCUploadBlock, as DATA8_948D6F
	db $0C,$21
	db $0C,$21
	incbin "../Extracted/data/DATA8_94A662.spc":4..2462
