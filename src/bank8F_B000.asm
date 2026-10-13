; Bank $8F, fourth 4 KB: the end of DATA8_8F8000 (see bank8F_8000), then the start of a second block for the sound CPU,
; from a long pointer list in bank $9C. Both come from data assets (Extracted/data/DATA8_8F8000.spc, DATA8_8FBB26.spc).

org $8FB000
	incbin "../Extracted/data/DATA8_8F8000.spc":12288..15142
DATA8_8FBB26:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $22,$08
	db $22,$08
	incbin "../Extracted/data/DATA8_8FBB26.spc":4..1242
