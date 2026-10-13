; Bank $90, third 4 KB: the end of DATA8_908000 (see bank90_8000), then the start of a block for the sound CPU from a
; long pointer list in bank $9C. From data assets (data/gfx/DATA8_908000.chr, DATA8_90A120.spc).

org $90A000
	incbin "data/gfx/DATA8_908000.chr":8192..8480
DATA8_90A120:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $20,$E8
	db $20,$E8
	incbin "data/sound/DATA8_90A120.spc":4..3808
