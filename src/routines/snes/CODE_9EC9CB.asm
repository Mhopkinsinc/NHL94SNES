; Unidentified routine.
CODE_9EC9CB:
	lda.b [a2]
	inc.b a2
	and.w #$00FF
	cmp.w #$000D
	bne CODE_9EC9CB
CODE_9EC9D7:
	dec.b d0
	bpl CODE_9EC9CB
	lda.b a2
	sec
	sbc.b a1
	sta.b d0
CODE_9EC9E2:
	lda.b a1
	clc
	adc.b d0
	sta.b a2
	lda.b $8F
	sta.b $93
	lda.w #$000A
	sta.w ScoutingReportTimer
	lda.w $0D47
	sta.b d0
	lda.b [a2]
	and.w #$00FF
	cmp.w #$0025
	beq .t1
	jmp.w CODE_9ECAB7

.t1:
	inc.b a2
	lda.b [a2]
	inc.w PlayerScrollCtr
	and.w #$00FF
	cmp.w #$0072
	bne .t3
	jmp.w CODE_9ECC4B

.t3:
	cmp.w #$0076
	bne .t1x
	jmp.w CODE_9ECCFE

.t1x:
	cmp.w #$0068
	bne .t2
	jmp.w CODE_9ECD05

.t2:
	cmp.w #$0056
	bne .t1xx
	jmp.w CODE_9ECCEC

.t1xx:
	cmp.w #$0048
	bne .t5
	jmp.w CODE_9ECCF5

.t5:
	cmp.w #$006D
	bne .t1x2
	jmp.w CODE_9ECC1E

.t1x2:
	cmp.w #$006E
	bne .t2x
	jmp.w CODE_80CC25

.t2x:
	cmp.w #$0074
	bne .t1xx2
	jmp.w CODE_9ECCA1

.t1xx2:
	cmp.w #$0065
	bne .t3x
	jmp.w CODE_9ECC71

.t3x:
	cmp.w #$0030
	bne .t1x2x
	jmp.w CODE_9ECB99

.t1x2x:
	cmp.w #$0031
	bne .t2xx
	jmp.w CODE_9ECB9E

.t2xx:
	cmp.w #$0032
	bne .t1xxx
	jmp.w CODE_9ECBA3

.t1xxx:
	cmp.w #$0033
	bne .t4
	jmp.w CODE_9ECBA8

.t4:
	cmp.w #$0034
	bne .t1x3
	jmp.w CODE_9ECBAD

.t1x3:
	cmp.w #$0035
	bne .t2x2
	jmp.w CODE_9ECBB2

.t2x2:
	cmp.w #$0036
	bne .t1xx2x
	jmp.w CODE_9ECBB7

.t1xx2x:
	cmp.w #$0037
	bne .t3xx
	jmp.w CODE_9ECBBC

.t3xx:
	cmp.w #$0038
	bne .t1x2xx
	jmp.w CODE_9ECBC1

.t1x2xx:
	cmp.w #$0039
	bne .t2xxx
	jmp.w CODE_9ECBC6

.t2xxx:
	cmp.w #$0061
	bne .t1xxxx
	jmp.w CODE_9ECBCB

.t1xxxx:
	cmp.w #$0062
	bne CODE_9ECAB7
	jmp.w CODE_9ECBD0
