; Unidentified routine.
CODE_9BB0B6:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
CODE_9BB0C4:
	rtl
