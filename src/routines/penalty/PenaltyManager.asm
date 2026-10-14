; Run the penalty work once a frame: times, new calls, the referee
PenaltyManager:
	jsl.l updatepentime
	jsl.l checkfornewpen
	jsl.l chkprogress
	jml.l UpdatePA
