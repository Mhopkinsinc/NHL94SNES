; Mode 7 tiles (145, 8bpp) of the licence screen: the NHL shield and the NHLPA logo (LicenceNHLMap, LicenceNHLPAMap)

LicenceTiles:		; packed for DecompressLZ, read by a screen setup
	db $10,$FB
	db $00,$24,$40
	incbin "../../../Extracted/data/gfx/DATA8_95F8C6.lz":5..1749
