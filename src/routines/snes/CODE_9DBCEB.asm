; Unidentified routine.
CODE_9DBCEB:
	ldy.w $0BE9
	bne CODE_9DBCF7
	ldy.w #$0000
	jsl.l WaitFrames_Inc
CODE_9DBCF7:
	rtl
