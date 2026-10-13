; Unidentified routine.
CODE_9FD87A:
	bit.w #$0002
	beq CODE_9FD8AB
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$0050
	sta.b $A5
	lda.w pfteam,x
	bne CODE_9FD89D
	lda.w #$FFB0
	sta.b $A5
CODE_9FD89D:
	lda.b $A5
	sta.w $1063,x
	lda.w #$FF70
	sta.w $1043,x
	stz.w $1003,x
CODE_9FD8AB:
	lda.w newpnum,x
	cmp.w pnum,x
	bne CODE_9FD8B6
CODE_9FD8B3:
	jmp.w $D9C2
