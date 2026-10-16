; Replace X's assignment with assdumpin ($14)
StartDumpIn:
	lda.w #$0014
	sta.b d0
	jmp.w assreplace
