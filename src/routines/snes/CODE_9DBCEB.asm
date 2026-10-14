; Unidentified routine.
CODE_9DBCEB:
	ldy.w $0BE9
	bne .rtl
	ldy.w #$0000
	jsl.l WaitFrames_Inc
.rtl:
	rtl
