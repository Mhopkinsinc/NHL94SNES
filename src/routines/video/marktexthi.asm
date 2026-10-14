; Raise the high end of the changed text map area to A
marktexthi:
	cmp.w textdirtyhi
	bcc .rtl
.1:
	sta.w textdirtyhi
.rtl:
	rtl
