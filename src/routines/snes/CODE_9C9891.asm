; Unidentified routine.
CODE_9C9891:
	stz.w $0CC3
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	lda.w #$0094
	sta.b $0E
	lda.w #DATA8_94BEAC
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93DFAD
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9A8000
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_9390FA
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0002
	sta.w $1D68
	rtl
