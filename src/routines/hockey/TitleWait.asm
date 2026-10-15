; Wait X frames (WaitFrames_Inc) unless a pad press has ended the title (titleskip)
TitleWait:
	ldy.w titleskip
	bne .rtl
	ldy.w #$0000
	jsl.l WaitFrames_Inc
.rtl:
	rtl
