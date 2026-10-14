; Shootout shooters menu item: pick the 3 shooters of each team
ShootoutShooters:
	jsl.l CODE_9DE0E9
	lda.w #$0001
	sta.b d0
	lda.b a2
	beq .team
	lda.w #$0002
	sta.b d0
.team:
	lda.w $1C84
	cmp.b d0
	beq CODE_80CA2E
	lda.w $1C86
	cmp.b d0
	beq CODE_80CA2E
	jmp.w CODE_80CA9C
