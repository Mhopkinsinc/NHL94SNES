; Huffman data at [$0C] to WRAM at [$10]
DecompressHuffman:
	sep #$10
	lda.b $0C
	clc
	adc.w #$0005
	sta.b $0C
	lda.b ($0C)
	sta.b $73
	inc.b $0C
	lda.b ($0C)
	inc.b $0C
	inc.b $0C
	xba
	sta.b $6C
	ldy.b #$08
	stz.b $77
	stz.b $75
	lda.w #$0010
	sta.b $14
	ldx.b #$FE
.2:
	inx
	inx
	dec.b $14
	asl.b $75
	lda.b $75
	sec
	sbc.b $77
	sta.w $0720,x
	jsr.w .149
	sta.w $0700,x
	clc
	adc.b $77
	sta.b $77
	lda.b $6F
	clc
	adc.b $75
	sta.b $75
	lda.b $6F
	bne .t1
	stz.w $0740,x
	bra .2

.t1:
	lda.b $75
	sta.b $00
	lda.b $14
	clc
	beq .1
.loop:
	asl.b $00
	dec a
	bne .loop
.1:
	lda.b $00
	sta.w $0740,x
	bcc .2
	txa
	lsr a
	sta.b $79
	ldx.b #$3E
.loop2:
	stz.w $0500,x
	stz.w $0540,x
	stz.w $0580,x
	stz.w $05C0,x
	dex
	dex
	bpl .loop2
	ldx.b #$7E
	stx.w WMADDH
	lda.w #$0100
	sta.w WMADDL
	ldx.b #$FF
.loop3:
	jsr.w .149
	sep #$20
	inc a
.loop4:
	inx
	bit.w $0500,x
	bmi .loop4
	dec a
	bne .loop4
	dec.w $0500,x
	rep #$20
	stx.w WMDATA
	dec.b $77
	bne .loop3
	tya
	asl a
	sta.b $71
	sep #$20
	ldx.b #$00
	txy
	stz.b $7B
.3:
	stx.b $00
	lda.b $7B
	asl a
	tax
	cpx.b #$10
	beq .9
	lda.w $0700,x
	sta.b $77
	ldx.b $7B
	lda.l .4,x
	sta.b $7D
	ldx.b $00
	bra .8
.4:		; lookup table entries for a code of each length, plus 1
	db $81,$41,$21,$11,$09,$05,$03,$02
.5:
	lda.b $7B
	asl a
	sta.b $00
	lda.w $0100,y
	sta.b $01
	iny
	cmp.b $73
	bne .1x
	lda.b $7B
	inc a
	sta.b $74
	lda.b #$12
	sta.b $00
.1x:
	sty.b $04
	ldy.b $7D
	bra .7
.6:
	lda.b $01
	sta.w $0500,x
	lda.b $00
	sta.w $0600,x
	inx
.7:
	dey
	bne .6
	ldy.b $04
.8:
	dec.b $77
	bpl .5
	inc.b $7B
	lda.b $79
	cmp.b $7B
	bcs .3
	stx.b $00
.9:
	ldx.b $00
	beq .1xx
	lda.b #$10
.loopx:
	sta.w $0600,x
	inx
	bne .loopx
.1xx:
	lda.b $79
	asl a
	tax
	rep #$20
	lda.l .10-$10,x	; by the longest code length, from 9 bits up
	sta.w $0760
	ldy.b $12
	sty.w WMADDH
	lda.b $10
	sta.w WMADDL
	lda.b $6C
	ldx.b $71
	jmp (.11,x)
.10:
	dw .111,.112,.114,.115,.116,.117,.118,.119
.11:
	dw $0000,.104,.92,.80,.68,.56,.44,.32,.20
.12:
	asl a
.13:
	asl a
.14:
	asl a
.15:
	asl a
.16:
	asl a
.17:
	asl a
.18:
	asl a
.19:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.20:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.21,x)
.21:
	dw .31,.42,.53,.64,.75,.86,.97,.12,.23,.22
.22:
	ldx.b #$10
	jmp.w .147
.23:
	ldx.b #$10
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.24:
	asl a
.25:
	asl a
.26:
	asl a
.27:
	asl a
.28:
	asl a
.29:
	asl a
.30:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
.31:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.32:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.33,x)
.33:
	dw .43,.54,.65,.76,.87,.98,.13,.24,.35,.34
.34:
	ldx.b #$0E
	jmp.w .147
.35:
	ldx.b #$0E
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.36:
	asl a
.37:
	asl a
.38:
	asl a
.39:
	asl a
.40:
	asl a
.41:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
.42:
	asl a
.43:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.44:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.45,x)
.45:
	dw .55,.66,.77,.88,.99,.14,.25,.36,.47,.46
.46:
	ldx.b #$0C
	jmp.w .147
.47:
	ldx.b #$0C
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.48:
	asl a
.49:
	asl a
.50:
	asl a
.51:
	asl a
.52:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
.53:
	asl a
.54:
	asl a
.55:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.56:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.57,x)
.57:
	dw .67,.78,.89,.100,.15,.26,.37,.48,.59,.58
.58:
	ldx.b #$0A
	jmp.w .147
.59:
	ldx.b #$0A
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.60:
	asl a
.61:
	asl a
.62:
	asl a
.63:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
.64:
	asl a
.65:
	asl a
.66:
	asl a
.67:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.68:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.69,x)
.69:
	dw .79,.90,.101,.16,.27,.38,.49,.60,.71,.70
.70:
	ldx.b #$08
	jmp.w .147
.71:
	ldx.b #$08
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.72:
	asl a
.73:
	asl a
.74:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
.75:
	asl a
.76:
	asl a
.77:
	asl a
.78:
	asl a
.79:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.80:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.81,x)
.81:
	dw .91,.102,.17,.28,.39,.50,.61,.72,.83,.82
.82:
	ldx.b #$06
	jmp.w .147
.83:
	ldx.b #$06
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.84:
	asl a
.85:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
.86:
	asl a
.87:
	asl a
.88:
	asl a
.89:
	asl a
.90:
	asl a
.91:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.92:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.93,x)
.93:
	dw .103,.18,.29,.40,.51,.62,.73,.84,.95,.94
.94:
	ldx.b #$04
	jmp.w .147
.95:
	ldx.b #$04
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.96:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
.97:
	asl a
.98:
	asl a
.99:
	asl a
.100:
	asl a
.101:
	asl a
.102:
	asl a
.103:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
.104:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (.105,x)
.105:
	dw .19,.30,.41,.52,.63,.74,.85,.96,.107,.106
.106:
	ldx.b #$02
	jmp.w .147
.107:
	ldx.b #$02
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
.108:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0730
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$01
	cmp.b $73
	beq .110
	jmp.w .128
.109:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0732
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$02
	cmp.b $73
	beq .110
	jmp.w .128
.110:
	jmp.w .146
.111:
	jmp.w .108
.112:
	cmp.w $0750
	bcc .108
.113:
	jmp.w .109
.114:
	cmp.w $0750
	bcc .108
	cmp.w $0752
	bcc .109
	jmp.w .120
.115:
	cmp.w $0750
	bcc .108
	cmp.w $0752
	bcc .109
	cmp.w $0754
	bcc .120
	jmp.w .121
.116:
	cmp.w $0750
	bcc .108
	cmp.w $0752
	bcc .109
	cmp.w $0754
	bcc .120
	cmp.w $0756
org $80C001
	bcc .121
	jmp.w .124
.117:
	cmp.w $0750
	bcc .108
	cmp.w $0752
	bcc .109
	cmp.w $0754
	bcc .120
	cmp.w $0756
	bcc .121
	cmp.w $0758
	bcc .124
	jmp.w .125
.118:
	cmp.w $0750
	bcc .111
	cmp.w $0752
	bcc .113
	cmp.w $0754
	bcc .120
	cmp.w $0756
	bcc .121
	cmp.w $0758
	bcc .124
	cmp.w $075A
	bcc .125
	jmp.w .126
.119:
	cmp.w $0750
	bcc .123
	cmp.w $0752
	bcc .113
	cmp.w $0754
	bcc .120
	cmp.w $0756
	bcc .121
	cmp.w $0758
	bcc .124
	cmp.w $075A
	bcc .125
	cmp.w $075C
	bcc .126
	jmp.w .127
.120:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0734
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$03
	cmp.b $73
	beq .122
	bra .128
.121:
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0736
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$04
	cmp.b $73
	beq .122
	bra .128
.122:
	jmp.w .146
.123:
	jmp.w .108
.124:
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0738
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$05
	cmp.b $73
	beq .122
	bra .128
.125:
	lsr a
	lsr a
	sec
	sbc.w $073A
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$06
	cmp.b $73
	beq .122
	bra .128
.126:
	lsr a
	sec
	sbc.w $073C
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$07
	cmp.b $73
	beq .122
	bra .128
.127:
	sec
	sbc.w $073E
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$08
	cmp.b $73
	beq .146
.128:
	sta.w WMDATA
	sta.b $08
	rep #$20
	inc.b $0C
	lda.b $6B
	jmp (.129-2,x)
.129:
	dw .137,.136,.135,.134,.133,.132,.131,.130
.130:
	asl a
	dey
	beq .144
.131:
	asl a
	dey
	beq .143
.132:
	asl a
	dey
	beq .142
.133:
	asl a
	dey
	beq .141
.134:
	asl a
	dey
	beq .140
.135:
	asl a
	dey
	beq .139
.136:
	asl a
	dey
	beq .138
.137:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	dey
	beq .145
	asl a
	dey
	beq .144
	asl a
	dey
	beq .143
	asl a
	dey
	beq .142
	asl a
	dey
	beq .141
.1xxx:
	asl a
	dey
	beq .140
	asl a
	dey
	beq .139
	asl a
.138:
	jmp.w .104
.139:
	jmp.w .92
.140:
	jmp.w .80
.141:
	jmp.w .68
.142:
	jmp.w .56
.143:
	jmp.w .44
.144:
	jmp.w .32
.145:
	jmp.w .20
.146:
	rep #$20
	inc.b $0C
	lda.b $6B
	jsr.w .152
	sta.b $6C
	jsr.w .150
	beq .148
	ldy.b $08
.loopxx:
	sty.w WMDATA
	dec a
	bne .loopxx
	lda.b $6C
	jmp (.11,x)
.147:
	ldy.b $74
	jsr.w .152
	sta.b $6C
	jsr.w .150
	beq .148
	ldy.b $08
.loopxxx:
	sty.w WMDATA
	dec a
	bne .loopxxx
	lda.b $6C
	jmp (.11,x)
.148:
	lda.b $6C
	bmi .t1x
	ldy.b #$01
	jsr.w .152
	sta.b $6C
	ldy.b $6D
	sty.w WMDATA
	sty.b $08
	ldy.b #$08
	jsr.w .152
	jmp (.11,x)

.t1x:
	rts
.149:
	stz.b $6F
	lda.b $6C
	asl a
	dey
	beq .3x
.1xxxx:
	bcc .7x
	asl a
	rol.b $6F
	dey
	beq .4x
.2x:
	asl a
	rol.b $6F
	dey
	beq .5x
	sta.b $6C
	lda.b $6F
	rts
.3x:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .1xxxx
.4x:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .2x
.5x:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	sta.b $6C
	lda.b $6F
	rts
.7x:
	stx.b $00
	ldx.b #$02
.1xxxxx:
	asl a
	dey
	beq .5xx
.2xx:
	inx
	bcc .1xxxxx
	stx.b $04
.3xx:
	asl a
	rol.b $6F
	dey
	beq .6x
.4xx:
	dex
	bne .3xx
	sta.b $6C
	asl.b $04
	ldx.b $04
	lda.l .151-4,x
	ldx.b $00
	clc
	adc.b $6F
	sta.b $6F
	rts
.5xx:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .2xx
.6x:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .4xx
.150:
	stz.b $6F
	lda.b $6C
	asl a
	dex
	dex
	beq .3xxx
.1xxxxxx:
	bcc .7xx
	asl a
	rol.b $6F
	dex
	dex
	beq .4xxx
.2xxx:
	asl a
	rol.b $6F
	dex
	dex
	beq .5xxx
	sta.b $6C
	lda.b $6F
	rts
.3xxx:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .1xxxxxx
.4xxx:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .2xxx
.5xxx:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	sta.b $6C
	lda.b $6F
	rts
.7xx:
	ldy.b #$02
.1xxxxxxx:
	asl a
	dex
	dex
	beq .5xxxx
.2xxxx:
	iny
	bcc .1xxxxxxx
	sty.b $14
.3xxxx:
	asl a
	rol.b $6F
	dex
	dex
	beq .6xx
.4xxxx:
	dey
	bne .3xxxx
	sta.b $6C
	txy
	lda.b $14
	and.w #$00FF
	asl a
	tax
	lda.l .151-4,x
	tyx
	clc
	adc.b $6F
	sta.b $6F
	rts
.5xxxx:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .2xxxx
.6xx:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .4xxxx
.151:		; bases of the variable-length numbers in the bit stream
	dw $0000,$0004,$000C,$001C,$003C,$007C,$00FC,$01FC,$03FC
	dw $07FC,$0FFC,$1FFC,$3FFC,$7FFC,$FFFC,$FFFC,$FFFC
.152:
	asl a
	dex
	dex
	beq .t1xx
	dey
	bne .152
	rts

.t1xx:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	dey
	bne .152
	rts
