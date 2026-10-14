; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_9782F8:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $02,$F4
	db $02,$F4
	incbin "../../../Extracted/data/sound/DATA8_9782F8.spc":4..760
