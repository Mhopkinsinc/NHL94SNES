; Unidentified routine.
CODE_9F9353:
	cmp.w textdirtylo
	bcs .rtl
.1:
	sta.w textdirtylo
.rtl:
	rtl
