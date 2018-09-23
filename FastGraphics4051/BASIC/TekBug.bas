100 REM DRAW PROGRAM from fast graphics HEX data
110 REM "z" WILL BE THE END OF FILE MARKER
111 REM
113 REM FIRST CHAR. HAS MOVE FLAG, 3 BIT HI X, 3 BIT HI Y
114 REM SECOND CHAR. HAS 7 BIT LO X, THIRD HAS 7 BIT LO Y
115 PAGE
116 V=1
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
3295 V=V+1
3300 A=A-64
3310 X=INT(A/8)*128
3320 Y=INT(A-X/16)*128+ASC(C$)
3330 X=X+ASC(B$)
3331 IF M<>21 THEN 3340
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
8000 DATA "7B7E334A15760B15120B173A0B1D610C2A060C3C280C51490C6B6714097F"
8001 DATA "152A17154A281571351D183C1D3F3E1D663C250B33253028255317257301"
8002 DATA "2C11672C1C5A6C09562C045C246874254A082529192507241D642B1D3F2D"
8003 DATA "1D1B2D1576241551171531061414720C765A0C5E3E0C491F0B397F0B2C5C"
8004 DATA "0B26370B24120B2401497A4611143111331D11530C117601181D7A184176"
8005 DATA "18647A210901212C0E214E1F216C3329094B291E672A34052A43262A504B"
8006 DATA "2A576D2B59152B59266B68282B6A122A666B2A5F442A521F29417D292B5C"
8007 DATA "29144021752621551020327F200D72186669184167181B69107172104D7C"
8008 DATA "112A0E110926096D3B4B53240B5C720C69370C70490C784F0C7F4B140740"
8009 DATA "141601131D4F53144B140C011403280C7D3C0C78420C723A0B677F0B5C28"
8010 DATA "53747B147A241C00421C094F1C12511C1B4F1C23331C2A155C1F101C1D22"
8011 DATA "1C183C1C10471C0B401C051F147E0164143A241849241F51242758242E54"
8012 DATA "243844642E4224274B242344241F3E51407811465E114D55115360115778"
8013 DATA "125C1B52671711627D11606D115753115146114846114251113769113576"
8014 DATA "5A4A531A4E351A531019606019645A196860196D741A71101A78331A7A63"
8015 DATA "620765220235197A7A196F5119684B19624B195B511955601A48101A3F46"
8016 DATA "1A3D5A63590E226833217572217965217E5E2902672A06052A0D2C2A1461"
8017 DATA "2B18176B25192A1C4D29117F29095A290053217953216F5C225D24235001"
8018 DATA "6C185A2C0D6524717D255310253022250B2F1D66381D3F3A1D183815712F"
8019 DATA "154F22152C10140E7D0C70630C55440C40240C31030B245E0B1B370B1912"
8020 DATA "0A197A4A1F7F0B1F120B223A0B2A5C0C35010C46220C5A420C745F141076"
8021 DATA "15310C15511D15742B1D1B311D3F331D643125092B252E1D254E0E246C78"
8022 DATA "2C0B5F2C11586B5F262B5F122A5D6D2A57492A4A242A3A03292563290D46"
8023 DATA "216F2E21501921300A200B7C18667418416F181D7210767A115307113314"
8024 DATA "11122C097644497240110E2A112E12115101107674181B6D18416B18666F"
8025 DATA "200D7621320321551421712A290F44292960293F7F2A50242A5B462A636B"
8026 DATA "2B66122B632842725E0B39100B440C0B441713013E13143313164B133358"
8027 DATA "13424F134263135C6E1367671367761C2C151C34101C34171C60281C6B2A"
8028 DATA "1C7526240519240524240931240F37243244243F4224533524534924684D"
8029 DATA "2479402479512C235C2C5D632C75512C7965341767342B5433117B2C7710"
8030 DATA "3411613400612C6C2A2C595C2C475A2C630C2B4A402B54402B6C2A2B5D28"
8031 DATA "2B572F2B57262B3D3C2C3A582C29562B2B372B36372B50242B411F2B2D2C"
8032 DATA "2B2D1D2B16312C0F4F2C004D2B027B246847245944235D22236824237E10"
8033 DATA "23710C235D1923590E23431D234628244133243D3C24323E241231240D2A"
8034 DATA "240B1F230F1523160C231F0C233D17235508235001223676222776231603"
8035 DATA "22166D1B7A011B7A2F1B733E23092C2309371B73491B78531C75191C6F1F"
8036 DATA "1C66241C3B101A3F651A4A691A64561A534F1A39611B345A1B2C581B186B"
8037 DATA "1B28721B34691B34741B2E781C2E0C136F70136F5A1B00611A05491A124F"
8038 DATA "1A2C3E1A1D331A05421A052812643912625E125774126F65127E5A137A40"
8039 DATA "13782213710A126274134A01135512135A2813576513465C134626134019"
8040 DATA "13330A13314F131D44121F0C122E14124F03113B7412260111266B11077D"
8041 DATA "1207190A63030A632C0A741D120924121B1D121B3C0A7D260A63350A7F49"
8042 DATA "121B3C12194412054F1205670A634F0B63010A78740A7867120570121667"
8043 DATA "13161513031F1303370B4D17095153110176111F67096939094B44094960"
8044 DATA "094465094624092A310A26530A40460A420E0A49050A464D0A265E0A3769"
8045 DATA "0A44610A446B0A39720B3908027B5A027B3E0A104D09171B09282A09421D"
8046 DATA "0931050910100A0C2402743302725E4B63080B7D1913140C0A7D7A0B6308"
8047 DATA "524F5612336512336D12396D124A63124F565B62741C51031C59081C6403"
8048 DATA "1B62745B4E441B4E7D1B64691B64511B60491B4E445A685C1A516B1B5122"
8049 DATA "1B60171B601F1B512C1B62331B662C1A68761A757A220B691A7E631A686D"
8050 DATA "1A685C632524231F2A241C1924291024291724211F242324242C26243222"
8051 DATA "23343323322A2325246B0615236F2A246C032B092C2B0F2F2B251B2B1A19"
8052 DATA "2B06262B06156C59012C52282C5F0E2C59016B772C2B5D422B6E72330046"
8053 DATA "330B4933243133152F33003E2B772C732B37330F4D2C7B03331563332B37"
8054 DATA "52371912335C124F4B125128126033127E21126B14125321125308123719"
8055 DATA "5A2E441A18511B16611B2C4F1A2E444B1944043C08043313043324044272"
8056 DATA "055E4705654F056E520D4465151F7015266C155E2F555328151D630D4658"
8057 DATA "057244056B42044D6E0440220445170B1B53445E1004491D04566B056520"
8058 DATA "057810045E10457D1905692B05703A05783C0D082D057D194D172F0D0342"
8059 DATA "15145C1528490D172F4C4F470D08010D0C130C5A514C655F0D19240D2828"
8060 DATA "0C6B6569417D310B3E310F35310F2A31152631151F31111D311117710D0E"
8061 DATA "310B0531020330007828757428736B286A6D286867285F69285D65285465"
8062 DATA "284E69284A65283F67217526711317310D14310D0E69093529380C293F19"
8063 DATA "29113E693467296140297348293D76684E69284572284378284A7C294A07"
8064 DATA "29500A295014295917295B2129632429682E29702E297535297B33310237"
8065 DATA "310035310835310F2A71083531063E310040297940296C3B295224293F05"
8066 DATA "283D76283F6F284A6F68576B284A74284E7828596F28576B685976294C01"
8067 DATA "295005285B7C285976695F0329540C29571229630A295F03696812295D1B"
8068 DATA "29611F296C1729681269731B296824296C2A29771F29731B697E2429752C"
8069 DATA "297931310228297E24710B28310031310633310F2A310B28686E7F296C07"
8070 DATA "297510297B12297E0C297307297701286E7F60777F28027C280D7A281874"
8071 DATA "281E6F28256728295C282D51282D46282D3B282931282526281E1F281819"
8072 DATA "280D14280210207710206C10206214205719204E1F204A2620463120413B"
8073 DATA "203F4620415120465C204A67204E6F20577420627A206C7C20777F606028"
8074 DATA "206065207E65280465280962280D5E280F55280D4F28094B280446280944"
8075 DATA "280D40280F37280F28280228280237280039207E40207C42206C42206C28"
8076 DATA "206028606C4B206C5C207C5C28005A28025528004F207C4B206C4B607776"
8077 DATA "280276280D7228166D281C6528205C28255128274628253B282031281C28"
8078 DATA "281623280D1F28021B207719206C1B20621F205923205328204E31204A3B"
8079 DATA "204A46204A51204E5C20536520596D206272206C76207776"
8080 DATA "z"