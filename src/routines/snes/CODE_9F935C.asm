; Unidentified routine.
CODE_9F935C:
	cmp.w textdirtyhi
	bcc .rtl
.1:
	sta.w textdirtyhi
.rtl:
	rtl
