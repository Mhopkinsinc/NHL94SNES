; Bank $8F, first 4 KB: the start of a block for the sound CPU, the one block of the sound upload list DATA8_80E73D in
; bank80_E000 (sent with the sound effect table there). From Extracted/data/DATA8_8F8000.spc; it continues in the
; following files.

org $8F8000
DATA8_8F8000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $3B,$22
	db $3B,$22
	incbin "../Extracted/data/DATA8_8F8000.spc":4..4096
