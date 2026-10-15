; In-game sample 4: sound 5, the ding of a new breakaway (StartBreakaway) and of a penalty running out (updatepwrplay); 94G SFXbeep1 at both

SampleBeep:		; for SPCUploadBlock, as DATA8_968000
	db $03,$45
	db $03,$45
	incbin "../../../Extracted/data/sound/SampleBeep.spc":4..841
