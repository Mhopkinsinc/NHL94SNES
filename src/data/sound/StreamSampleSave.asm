; Streamed sound 4 (a goalie save in puckgoalie, and an injury in setInjuryType): a block that UpdateStreamSfx streams in

StreamSampleSave:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $20,$E8
	db $20,$E8
	incbin "../../../Extracted/data/sound/DATA8_90A120.spc":4..8428
