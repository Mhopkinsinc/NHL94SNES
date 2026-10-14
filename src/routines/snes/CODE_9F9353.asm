; Unidentified routine.
CODE_9F9353:
	cmp.w textdirtylo
	bcs CODE_9F935B
CODE_9F9358:
	sta.w textdirtylo
CODE_9F935B:
	rtl
