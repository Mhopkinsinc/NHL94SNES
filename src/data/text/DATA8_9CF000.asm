DATA8_9CF000:
	dw $0005 : db $BF,$0B,$07
DATA8_9CF005:
	dw $0005 : db $BF,$00,$09
DATA8_9CF00A:
	dw $0013 : db $BF,$09,$0D,"Return to Game"
DATA8_9CF01D:
	dw $001A : db $9F,$06,$0E,"Restore default lines"
DATA8_9CF037:
	dw $0005 : db $BF,$09,$0D
DATA8_9CF03C:
	dw $0005 : db $9F,$09,$0D
ReturnToGame:
	%String("Return to Game")
DATA8_9CF051:
	dw $0005 : db $BF,$06,$0E
DATA8_9CF056:
	dw $0005 : db $9F,$06,$0E
RestoreDefaultLines:
	%String("Restore default lines")
DATA8_9CF072:
	dw $0005 : db $BF,$00,$0D
DATA8_9CF077:
	dw $0005 : db $BF,$00,$0E
DATA8_9CF07C:
	dw $0005 : db $BF,$00,$01
DATA8_9CF081:
	dw $0005 : db $BF,$00,$01
DATA8_9CF086:
	dw $000B : db $AF,$03,$02,"Player"
DATA8_9CF091:
	dw $0006 : db $AF,$02,$02,"{"
DATA8_9CF097:
	dw $0006 : db $AF,$09,$02,"}"
DATA8_9CF09D:
	dw $0005 : db $BF,$00,$00
DATA8_9CF0A2:
	dw $0005 : db $BF,$07,$09
DATA8_9CF0A7:
	dw $0005 : db $BF,$00,$03
ScoringLabel:
	%String("Scoring")
ScoringSummaryHead:
	dw $0023 : db $AF,$01,$09,"Per Time Tm  Goal/Assist   P/S"
NoScoring:
	dw $000F : db $BF,$0B,$0D,"No Scoring"
ScoringPP2:
	%String("PP2")
ScoringPP:
	%String("PP")
ScoringSH:
	%String("SH")
ScoringSH2:
	%String("SH2")
PenaltiesLabel:
	%String("Penalties")
PenaltySummaryHead:
	dw $0023 : db $AF,$01,$09,"Per Time Tm  Player/Penalty PM"
NoPenalties:
	dw $0011 : db $BF,$0A,$0D,"No Penalties"
DATA8_9CF138:
	dw $0005 : db $BF,$09,$06
ScrollHint:
	%String("   Scroll  }")
DATA8_9CF14B:
	dw $0006 : db $AF,$15,$07,"}"
DATA8_9CF151:
	dw $0006 : db $AF,$15,$07," "
DATA8_9CF157:
	dw $0006 : db $AF,$0A,$07,"{"
DATA8_9CF15D:
	dw $0006 : db $AF,$0A,$07," "
DATA8_9CF163:
	dw $0005 : db $BF,$06,$0A
CrowdMeter:
	%String("CROWD METER")
DATA8_9CF175:
	dw $000C : db $AF,$05,$11,"Current"
DATA8_9CF181:
	dw $0007 : db $AF,$19,$11,"db"
DATA8_9CF188:
	dw $000C : db $BF,$05,$11,"Current"
DATA8_9CF194:
	dw $0007 : db $BF,$19,$11,"db"
DATA8_9CF19B:
	dw $0009 : db $AF,$05,$13,"Peak"
DATA8_9CF1A4:
	dw $0007 : db $AF,$19,$13,"db"
DATA8_9CF1AB:
	dw $0009 : db $BF,$05,$13,"Peak"
DATA8_9CF1B4:
	dw $0007 : db $BF,$19,$13,"db"
DATA8_9CF1BB:
	dw $000C : db $AF,$05,$15,"Average"
DATA8_9CF1C7:
	dw $0007 : db $AF,$19,$15,"db"
DATA8_9CF1CE:
	dw $000C : db $BF,$05,$15,"Average"
DATA8_9CF1DA:
	dw $0007 : db $BF,$19,$15,"db"
OtherScores:
	%String("Other Scores")
NoOtherGames:
	dw $0014 : db $9F,$09,$0B,"No Other Games."
PasswordLabel:
	%String("Password")
DATA8_9CF20D:
	dw $0005 : db $AF,$01,$12
DATA8_9CF212:
	dw $0010 : db $AF,$02,$0E,"Password",$AF,$15,$0E
DATA8_9CF222:
	dw $0005 : db $BF,$02,$10
DATA8_9CF227:
	dw $0005 : db $AF,$01,$11
SelectLeft:
	%String(" < ")
DATA8_9CF231:
	dw $0005 : db $AF,$14,$0D
BadPassword:
	dw $0014 : db $BF,$02,$13,"Bad Password   "
DATA8_9CF24A:
	dw $0014 : db $BF,$02,$14,"A - Retry      "
DATA8_9CF25E:
	dw $0014 : db $BF,$02,$15,"Y - Exit Screen"
DATA8_9CF272:
	dw $0010 : db $AF,$0A,$18,"           "
DATA8_9CF282:
	dw $0005 : db $AF,$02,$13
DATA8_9CF287:
	dw $0014 : db $AF,$02,$13," {}[] - Select "
DATA8_9CF29B:
	dw $0014 : db $AF,$02,$14,"    A - Next   "
DATA8_9CF2AF:
	dw $0014 : db $AF,$02,$15,"    Y - Back   "
DATA8_9CF2C3:
	dw $0010 : db $AF,$0A,$18,"Press start"
PlayerStatsTitle:
	%String("Player Stats")
DATA8_9CF2E1:
	dw $0005 : db $BF,$09,$06
DATA8_9CF2E6:
	dw $0015 : db $9F,$08,$1A,"Y - Switch Teams"
PlayerStatsHeading:
	%String("Player Stats")
DATA8_9CF309:
	dw $0023 : db $9F,$01,$09,"  Player         G  A Pt Sh PM"
DATA8_9CF32C:
	dw $0023 : db $9F,$01,$09,"  Goalie          GA  Sh  Ptg "
DATA8_9CF34F:
	dw $0005 : db $AF,$0A,$07
GameStats:
	%String("Game Stats")
DATA8_9CF360:
	dw $0005 : db $BF,$01,$09
DATA8_9CF365:
	dw $0005 : db $BF,$16,$09
StatPercent:
	%String("%")
StatSlash:
	%String("/")
DATA8_9CF370:
	dw $0005 : db $BF,$0B,$02
DATA8_9CF375:
	dw $0005 : db $BF,$0B,$02
StarsOfTheGame:
	dw $0016 : db $BF,$0D,$03,"Stars of the Game"
DATA8_9CF390:
	dw $0005 : db $BF,$01,$0D
DATA8_9CF395:
	dw $0005 : db $FF,$02,$0E
DATA8_9CF39A:
	dw $0005 : db $FF,$00,$00
MatchupsLabel:
	%String("Matchups")
DATA8_9CF3A9:
	dw $0005 : db $BF,$01,$0A
DATA8_9CF3AE:
	dw $0005 : db $BF,$16,$0A
DATA8_9CF3B3:
	dw $0005 : db $EF,$03,$09
DATA8_9CF3B8:
	dw $0005 : db $EF,$01,$08
DATA8_9CF3BD:
	dw $0005 : db $EF,$19,$09
DATA8_9CF3C2:
	dw $0005 : db $EF,$14,$08
DATA8_9CF3C7:
	dw $000F : db $EF,$01,$08,"Overall",$EF,$03,$09
DATA8_9CF3D6:
	dw $000F : db $EF,$18,$08,"Overall",$EF,$19,$09
DATA8_9CF3E5:
	dw $0005 : db $EF,$0A,$04
DATA8_9CF3EA:
	dw $000E : db $EF,$0B,$06,"Advantage"
DATA8_9CF3F8:
	dw $000A : db $FF,$0D,$09,"[ [ ["
DATA8_9CF402:
	dw $000A : db $FF,$0D,$09,"] ] ]"
DATA8_9CF40C:
	dw $0009 : db $FF,$0D,$09,"None"
DATA8_9CF415:
	dw $0005 : db $AF,$00,$00
DATA8_9CF41A:
	dw $0005 : db $CF,$00,$00
DATA8_9CF41F:
	dw $0005 : db $DF,"8h"
TeamRosterTitle:
	%String("Team Roster")
DATA8_9CF431:
	dw $0017 : db $9F,$07,$0C,"Player",$9F,$19,$0C,"Rating",$BF,$01,$08
DATA8_9CF448:
	dw $0005 : db $BF,$10,$08
DATA8_9CF44D:
	dw $0005 : db $BF,$0B,$06
TeamRosterSwap:
	%String("Team Roster")
DATA8_9CF45F:
	dw $0005 : db $9F,$02,$09
DATA8_9CF464:
	dw $0005 : db $BF,$00,$0D
DATA8_9CF469:
	dw $0018 : db $9F,$08,$1A,"Y - Switch Teams",$BF,$00,$0E
DATA8_9CF481:
	dw $0008 : db $BF,$05,$0A,"Not"
DATA8_9CF489:
	dw $000C : db $BF,$03,$0B,"Playing"
DATA8_9CF495:
	dw $0008 : db $BF,$0F,$0A,"Not"
DATA8_9CF49D:
	dw $000C : db $BF,$0D,$0B,"Playing"
DATA8_9CF4A9:
	dw $001A : db $EF,$05,$19,"Use [] to select team"
DATA8_9CF4C3:
	dw $001A : db $EF,$05,$1A,"Press START when done"
DATA8_9CF4DD:
	dw $001D : db $BF,$04,$19,"At least one person must"
DATA8_9CF4FA:
	dw $001B : db $BF,$04,$1A,"  play in playoff mode"
DATA8_9CF515:
	dw $001D : db $BF,$04,$19,"Only one player per team"
DATA8_9CF532:
	dw $001C : db $BF,$04,$1A," is allowed in shootout"
DATA8_9CF54E:
	dw $001D : db $EF,$04,$19," Use [] to select team  "
DATA8_9CF56B:
	dw $001D : db $EF,$04,$1A," Press START when done  "
PlayerSelectTitle:
	%String("Player select")
GameSetupTitle:
	%String("Game Setup")
DATA8_9CF5A3:
	dw $0005 : db $AF,$00,$00
GameSetupAlt:
	%String("Game Setup")
PlayerSelectAlt:
	%String("Player select")
DATA8_9CF5C3:
	dw $001E : db $EF,$04,$10,"The MultiPlayer 5 must be"
DATA8_9CF5E1:
	dw $001C : db $EF,$04,$12,"connected to Controller"
DATA8_9CF5FD:
	dw $000F : db $EF,$0A,$14,"Socket #2."
DATA8_9CF60C:
	dw $001E : db $EF,$04,$10,"The MultiPlayer 5 is not "
DATA8_9CF62A:
	dw $001E : db $EF,$04,$12,"designed for use with the"
DATA8_9CF648:
	dw $001B : db $EF,$06,$14,"Super NES Super Scope."
DATA8_9CF663:
	dw $001D : db $EF,$04,$10,"The MultiPlayer 5 is not"
DATA8_9CF680:
	dw $001E : db $EF,$04,$12,"designed for use with the"
DATA8_9CF69E:
	dw $0015 : db $EF,$09,$14,"Super NES mouse."
DATA8_9CF6B3:
	dw $0005 : db $9F,$00,$03
StrengthsLabel:
	%String("Strengths:")
StrengthsLabelB:
	%String("Strengths:")
OverallRating:
	%String("Overall Rating")
DATA8_9CF6E0:
	dw $0005 : db $9F,$0C,$04
TeamRating:
	%String("Team Rating")
DATA8_9CF6F2:
	dw $0026 : db $AF,$08,$18,"[] Switch cards",$AF,$08,$19,"Y  Switch teams"
DATA8_9CF718:
	dw $0012 : db $BF,$01,$19,"   ",$16,$17,$18,$19,$BF,$01,$1A,"   "
DATA8_9CF72A:
	dw $0005 : db $BF,$01,$19
DATA8_9CF72F:
	dw $0005 : db $BF,$00,$0A
DATA8_9CF734:
	dw $0005 : db $BF,$05,$0A
DATA8_9CF739:
	dw $0005 : db $BF,$11,$0D
DATA8_9CF73E:
	dw $0005 : db $BF,$0B,$03
DATA8_9CF743:
	dw $0023 : db $BF,$0C,$04,"Injury to:",$BF,$0C,$06,"Out for period",$BF,$0C,$05
DATA8_9CF766:
	dw $0010 : db $BF,$14,$06,"the game",$BF,$0C,$05
DATA8_9CF776:
	dw $0005 : db $BF,$04,$0C
DATA8_9CF77B:
	dw $001B : db $BF,$05,$0D,"                      "
DATA8_9CF796:
	dw $0005 : db $EF,$02,$0E
	dw $0005 : db $BF,$01,$0A
DATA8_9CF7A0:
	dw $0005 : db $BF,$11,$0D
PeriodStats:
	%String("Period Stats")
DATA8_9CF7B3:
	dw $0005 : db $BF,$01,$0B
DATA8_9CF7B8:
	dw $0005 : db $BF,$01,$0E
DATA8_9CF7BD:
	dw $0005 : db $BF,$01,$13
TotalShotsLine:
	%String("Total")
	%String("Shots")
	dw $000E : db $EF,$0B,$19,"Y - Goals"
GoalsLabel:
	%String("Goals")
DATA8_9CF7E5:
	dw $000E : db $EF,$0B,$19,"Y - Shots"
HighlightFrom:
	%String("Highlight from game:")
DATA8_9CF809:
	dw $0005 : db $BF,$05,$0C
DATA8_9CF80E:
	dw $0005 : db $BF,$05,$0C
DATA8_9CF813:
	%String("  ")
DATA8_9CF817:
	%String("   ")
DATA8_9CF81C:
	dw $0005 : db $BF,$00,$17
DATA8_9CF821:
	dw $0005 : db $BF,$01,$18
DATA8_9CF826:
	dw $000A : db $BF,$01,$1A,"Round"
DATA8_9CF830:
	dw $0005 : db $BF,$17,$17
DATA8_9CF835:
	dw $0005 : db $BF,$1C,$18
DATA8_9CF83A:
	dw $0005 : db $BF,$18,$18
DATA8_9CF83F:
	dw $0005 : db $BF,$0F,$01
DATA8_9CF844:
	dw $0005 : db $BF,$0F,$1A
DATA8_9CF849:
	dw $0005 : db $BF,$0F,$02
DATA8_9CF84E:
	dw $0005 : db $BF,$1B,$04
DATA8_9CF853:
	dw $0005 : db $BF,$09,$04
DATA8_9CF858:
	dw $0005 : db $BF,$14,$08
DATA8_9CF85D:
	dw $0005 : db $BF,$03,$08
	dw $0005 : db $BF,$05,$0C
DATA8_9CF867:
	dw $0005 : db $BF,$02,$17
DATA8_9CF86C:
	dw $0005 : db $BF,$02,$17
DATA8_9CF871:
	%String("                          ")
DATA8_9CF88D:
	dw $0005 : db $FF,$0B,$02
DATA8_9CF892:
	dw $0005 : db $BF,$0B,$02
DATA8_9CF897:
	dw $0012 : db $BF,$0E,$06,"Assist by:",$BF,$0C,$07
DATA8_9CF8A9:
	dw $0005 : db $BF,$0C,$08
DATA8_9CF8AE:
	dw $0005 : db $BF,$00,$00
VersusText:
	%String("vs.")
ShootoutPenShot:
	%String("Shootout")
	%String("Pen. Shot")
DATA8_9CF8CD:
	dw $0005 : db $BF,$00,$00
DATA8_9CF8D2:
	dw $0005 : db $BF,$01,$19
DATA8_9CF8D7:
	%String(" ")
DATA8_9CF8DA:
	dw $0005 : db $FF,$00,$00
DATA8_9CF8DF:
	dw $0005 : db $FF,$00,$00
DATA8_9CF8E4:
	dw $0005 : db $BF,$13,$01
DATA8_9CF8E9:
	dw $0005 : db $BF,$05,$0C
DATA8_9CF8EE:
	dw $000F : db $BF,$0C,$0E,"Timeout",$BF,$0A,$0F
DATA8_9CF8FD:
	dw $0005 : db $BF,$06,$0D
DATA8_9CF902:
	%String("                    ")
DATA8_9CF918:
	dw $0005 : db $BF,$05,$0C
DATA8_9CF91D:
	dw $0005 : db $BF,$06,$0D
DATA8_9CF922:
	dw $0005 : db $BF,$06,$0F
DATA8_9CF927:
	dw $0005 : db $BF,$06,$10
DATA8_9CF92C:
	dw $0005 : db $BF,$05,$0C
DATA8_9CF931:
	dw $0005 : db $BF,$0C,$0D
DATA8_9CF936:
	dw $0005 : db $BF,$0C,$0E
DATA8_9CF93B:
	dw $0005 : db $BF,$0C,$0F
DATA8_9CF940:
	dw $0005 : db $BF,$0C,$10
