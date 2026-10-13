; Unidentified routine.
CODE_9BAF3D:
	lda.w #$FFFF
	sta.w $0CAB
	lda.w #$0020
	trb.w sflags
	jmp.w $ACE5
