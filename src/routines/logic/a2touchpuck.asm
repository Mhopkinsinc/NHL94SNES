; Unidentified routine.
a2touchpuck:
	ldy.b $91
	cpy.w #$0018
	bcc CODE_9EC4FD
	jmp.w $C5A7
