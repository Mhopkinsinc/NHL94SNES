; Send the four blocks that turn the title sample set into the menu set, then mark $1D68 = 2
SPCTitleToMenu:
	stz.w $0CC3
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	lda.w #DATA8_94BEAC>>16
	sta.b $0E
	lda.w #DATA8_94BEAC
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #DATA8_93DFAD>>16
	sta.b $0E
	lda.w #DATA8_93DFAD
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #DATA8_9A8000>>16
	sta.b $0E
	lda.w #DATA8_9A8000
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #DATA8_9390FA>>16
	sta.b $0E
	lda.w #DATA8_9390FA
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0002
	sta.w $1D68
	rtl
