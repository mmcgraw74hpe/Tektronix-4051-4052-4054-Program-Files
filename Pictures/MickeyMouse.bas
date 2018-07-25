100 REM DRAW PROGRAM from fast graphics HEX data
110 REM "z" WILL BE THE END OF FILE MARKER
111 REM
113 REM FIRST CHAR. HAS MOVE FLAG, 3 BIT HI X, 3 BIT HI Y
114 REM SECOND CHAR. HAS 7 BIT LO X, THIRD HAS 7 BIT LO Y
115 PAGE
120 READ G$
130 C$=SEG(G$,1,1)
140 IF C$<>"z" THEN 170
150 HOME
160 END
170 F1=LEN(G$)/6
180 FOR I=0 TO F1-1
190 H$=SEG(G$,I*6+1,6)
3210 P=1
3220 X$=SEG(H$,P,2)
3225 GOSUB 3390
3226 A$=Y$
3230 X$=SEG(H$,P+2,2)
3233 GOSUB 3390
3235 B$=Y$
3240 X$=SEG(H$,P+4,2)
3242 GOSUB 3390
3243 C$=Y$
3250 A=ASC(A$)
3260 IF A=>64 THEN 3290
3270 M=20
3280 GO TO 3310
3290 M=21
3300 A=A-64
3310 X=INT(A/8)*128
3320 Y=INT(A-X/16)*128+ASC(C$)
3330 X=X+ASC(B$)
3340 PRINT @32,M:X*130/1023,Y*100/800
3350 P=P+6
3360 IF P<=LEN(X$)-2 THEN 3220
3350 NEXT I
3360 GOTO 120
3390 REM SUBROUTINE TO CONVERT X1$ TWO CHARACTER HEX TO ONE CHAR X2$
3400 Q$=SEG(X$,1,1)
3410 Q1=ASC(Q$)-48
3412 IF Q1<10 THEN 3420
3414 Q1=Q1-7
3420 Q$=SEG(X$,2,1)
3422 Q2=ASC(Q$)-48
3424 IF Q2<10 THEN 3430
3426 Q2=Q2-7
3430 Q1=Q1*16+Q2
3440 Y$=CHR(Q1)
3450 RETURN
9000 data "6B223D2B1E542B16652B0F742C000724711624652224532C243C3724263F"
9005 data "2410421C79421C63421C4C3F1C36371C232C1C36421C45591C4C701D4C05"
9010 data "1D481C1D41321D36481D1F5E1D096D157275155B79154579152E71151866"
9015 data "1506530D773E0D6C270D68100C687A0C6C640C774E14023F14112C14271E"
9020 data "144512145B12147216147D1A1C10221C0116147207136774135B5E135448"
9025 data "134C32134C23134C32134548133A5B132E69132074140D000C77070C600B"
9030 data "0C4A070C33000B1D740B0662037B54036F3D036C26036C10026F7A027764"
9035 data "0A02510A11420A28340A3E2C0A55280A6C2812022C121838122342122E4D"
9040 data "123A5C124573134C10125073125464125B5112634212722C127D211A140E"
9045 data "192A7F19417419586D19676D19766D5A630A19766D21015E211053212644"
9050 data "21353C214739215339215E3C21714829005A29046A29077B2A070A2A0021"
9055 data "627521227816227C03217C7421755E216953215E4B21534B21474B213C4F"
9060 data "21315721265E2110741A7D0A1A72211A6A381A674D1A63641A794D220542"
9065 data "221B3422312C224725225E212275212A0B212A22252A342C2A44342A5A42"
9070 data "2A715832036F330E06331214331626331A3D331654331262330B62330065"
9075 data "2B78692B65652B5A622B44572B384C2B293D2B1A266B78692B71742C6D00"
9080 data "2C710B2C7816340722341222341D1E34251234280733287C332571331D65"
9085 data "3312626B293D2B223D2B16392B0B352B002E23752323691461087F221003"
9090 data "221E03212D7F21357B21476A61357B223C0322470321567821626D21695E"
9095 data "216953635332235326234F1F23401F233126232632231E3D23175023135E"
9100 data "23176D231E74232674232D71233C5E23474C234F3D235332234732234039"
9105 data "23404123474C6B0F502B0F442B0B3D2B003D237544236954236262235E74"
9110 data "246200246507246D072478002B00742B07652B0B5B2B0F502B07502B0054"
9115 data "2B005B2B076559367B1A2A071A1F161A182C1A14421A18581A1F671A2E7A"
9120 data "1B41061B580D1B6A0D1B79092308061B79171B6E261B67321B5F411B5854"
9125 data "1B54691B54781C5B0B1C671A1C7222240525241322242616243507234078"
9130 data "24400324400F24471E245322245E22246D1A5B76621B766D1B76741C7900"
9135 data "24050B644F0F245A16246216246D12611053196A5E196353196E31195B10"
9140 data "196305196A05212623215323217505290701290F0C29043129165329165A"
9145 data "290B5E29005A61264421293921292D212623615339215631215626215323"
9150 data "692274"
9155 DATA "z"
