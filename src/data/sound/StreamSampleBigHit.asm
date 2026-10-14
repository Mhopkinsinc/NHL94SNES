; Streamed sound 3 (FallDown, a big hit): a block for SPCUploadBlock that UpdateStreamSfx streams in

StreamSampleBigHit:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $22,$08
	db $22,$08
	incbin "../../../Extracted/data/sound/DATA8_8FBB26.spc":4..8716
