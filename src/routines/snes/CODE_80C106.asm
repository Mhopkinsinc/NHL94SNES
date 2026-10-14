; Unidentified routine.
CODE_80C106:
	asl a
	dey
	beq CODE_80C159
CODE_80C10A:
	asl a
	dey
	beq CODE_80C156
CODE_80C10E:
	asl a
	dey
	beq CODE_80C153
CODE_80C112:
	asl a
	dey
	beq CODE_80C150
CODE_80C116:
	asl a
	dey
	beq CODE_80C14D
CODE_80C11A:
	asl a
	dey
	beq CODE_80C14A
CODE_80C11E:
	asl a
	dey
	beq CODE_80C147
CODE_80C122:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	dey
	beq CODE_80C15C
	asl a
	dey
	beq CODE_80C159
	asl a
	dey
	beq CODE_80C156
	asl a
	dey
	beq CODE_80C153
	asl a
	dey
	beq CODE_80C150
.1:
	asl a
	dey
	beq CODE_80C14D
	asl a
	dey
	beq CODE_80C14A
	asl a
CODE_80C147:
	jmp.w CODE_80BF53
CODE_80C14A:
	jmp.w CODE_80BF00
