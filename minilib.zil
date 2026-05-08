"MINIMAL ZIL LIBRARY FOR ZIP/V3"
"Copyright (c) 2026 Andy Kosela"
"MIT License"

"DIRECTION PROPERTY FORMAT"
"This is the normal Infocom-style room-exit format."
<PROPDEF DIRECTIONS <>
  (DIR TO R:ROOM = (UEXIT 2) (REXIT <ROOM .R>))
  (DIR SORRY S:STRING = (NEXIT 3) (NEXITSTR <STRING .S>) <BYTE 0>)
  (DIR PER F:FCN = (FEXIT 4) (FEXITFCN <WORD .F>) <WORD 0>)
  (DIR TO R:ROOM IF G:GLOBAL "OPT" ELSE S:STRING = (CEXIT 5) (REXIT <ROOM .R>) (CEXITSTR <STRING .S>) (CEXITFLAG <GLOBAL .G>))
  (DIR R:ROOM = (UEXIT 2) (REXIT <ROOM .R>))
  (DIR S:STRING = (NEXIT 3) (NEXITSTR <STRING .S>) <BYTE 0>)>

<DIRECTIONS NORTH SOUTH EAST WEST UP DOWN IN OUT>

<SYNONYM NORTH N>
<SYNONYM SOUTH S>
<SYNONYM EAST E>
<SYNONYM WEST W>
<SYNONYM UP U>
<SYNONYM DOWN D>
<SYNONYM IN INSIDE>
<SYNONYM OUT OUTSIDE>

<CONSTANT INVENTORY 255>
<CONSTANT NOWHERE 0>
<CONSTANT OBJ-NONE 0>

<GLOBAL ROOM 0>
<GLOBAL STATUS-DUMMY 0>
<GLOBAL TURNS 0>
<GLOBAL GAME-OVER <>>
<GLOBAL FIRST-LOOK <>>
<GLOBAL LAST-OBJECT 0>
<GLOBAL SEPARATE-PROMPT <>>
<GLOBAL EXIT-COUNT 0>
<GLOBAL MANUAL-DICE <>>
<GLOBAL IN-CONSOLE <>>

<GLOBAL INBUF <ITABLE 80 (BYTE) 0>>
<GLOBAL LEXBUF <ITABLE 32 (BYTE) 0>>

<BUZZ THE A AN AT TO OF WITH USING ON OFF
  HLP WHE FLG ROM GOT DRP HEA HUR KIL OPN FRE DRN LIT DUS REV FIL
  CEL HAL ARM COR GRD ALC NIC CRT VLT STA SPR BRG BON WEL SHR
  SWD LMP HEL MAL RNG CHS GSW BPK FLA>

<SYNTAX LOOK = V-LOOK>
<VERB-SYNONYM LOOK L>

<SYNTAX EXAMINE OBJECT = V-EXAMINE>
<VERB-SYNONYM EXAMINE X C>

<SYNTAX TAKE OBJECT = V-TAKE>
<VERB-SYNONYM TAKE GET G>

<SYNTAX DROP OBJECT = V-DROP>

<SYNTAX KILL OBJECT = V-KILL>
<VERB-SYNONYM KILL K>

<SYNTAX OPEN OBJECT = V-OPEN>
<VERB-SYNONYM OPEN O>
<SYNTAX CLOSE OBJECT = V-CLOSE>
<VERB-SYNONYM CLOSE CL>

<SYNTAX UNLOCK OBJECT = V-UNLOCK>
<SYNTAX USE OBJECT = V-USE>
<SYNTAX LIGHT OBJECT = V-LIGHT>
<VERB-SYNONYM LIGHT IGNITE>

<SYNTAX TURN OBJECT = V-TURN>
<SYNTAX SEARCH = V-SEARCH>
<SYNTAX SEARCH OBJECT = V-SEARCH>
<VERB-SYNONYM SEARCH SEA>

<SYNTAX INVENTORY = V-INVENTORY>
<VERB-SYNONYM INVENTORY I>

<SYNTAX DICE = V-DICE>

<SYNTAX HELP = V-HELP>
<SYNTAX EXITS = V-EXITS>

<SYNTAX WAIT = V-WAIT>
<VERB-SYNONYM WAIT Z>

<SYNTAX TALK OBJECT = V-TALK>
<VERB-SYNONYM TALK SPEAK>

<SYNTAX GIVE OBJECT TO OBJECT = V-GIVE>
<SYNTAX DRINK OBJECT = V-DRINK>

<VERB-SYNONYM HELP H>
<VERB-SYNONYM EXITS XITS EX>

<SYNTAX SAVE = V-SAVE>
<SYNTAX RESTORE = V-RESTORE>

<SYNTAX QUIT = V-QUIT>
<VERB-SYNONYM QUIT Q>

<SYNTAX RESTART = V-RESTART>

<SYNTAX WALK DIRECTION = V-WALK>
<VERB-SYNONYM WALK GO>

<SYNTAX RPG = V-RPG>
<SYNTAX CONSOLE = V-CONSOLE>
<VERB-SYNONYM CONSOLE CON>

<ROUTINE V-LOOK () <RTRUE>>
<ROUTINE V-EXAMINE () <RTRUE>>
<ROUTINE V-TAKE () <RTRUE>>
<ROUTINE V-DROP () <RTRUE>>
<ROUTINE V-KILL () <RTRUE>>
<ROUTINE V-OPEN () <RTRUE>>
<ROUTINE V-CLOSE () <RTRUE>>
<ROUTINE V-UNLOCK () <RTRUE>>
<ROUTINE V-USE () <RTRUE>>
<ROUTINE V-LIGHT () <RTRUE>>
<ROUTINE V-TURN () <RTRUE>>
<ROUTINE V-SEARCH () <RTRUE>>
<ROUTINE V-INVENTORY () <RTRUE>>
<ROUTINE V-DICE () <RTRUE>>
<ROUTINE V-HELP () <RTRUE>>
<ROUTINE V-EXITS () <RTRUE>>
<ROUTINE V-WAIT () <RTRUE>>
<ROUTINE V-TALK () <RTRUE>>
<ROUTINE V-GIVE () <RTRUE>>
<ROUTINE V-DRINK () <RTRUE>>
<ROUTINE V-SAVE () <RTRUE>>
<ROUTINE V-RESTORE () <RTRUE>>
<ROUTINE V-QUIT () <RTRUE>>
<ROUTINE V-RESTART () <RTRUE>>
<ROUTINE V-WALK () <RTRUE>>
<ROUTINE V-RPG () <RTRUE>>
<ROUTINE V-CONSOLE () <RTRUE>>

<ROUTINE SOFT-RESTART ()
  <SETG IN-CONSOLE <>>
  <PREPARE-BUFFERS>
  <GAME-TITLE>
  <GAME-BYLINE>
  <PRINT-BANNER>
  <CRLF>
  <TELL
"Type HELP for a list of commands." CR CR>
  <INIT-GAME>
  <DESCRIBE-ROOM>
  <RTRUE>>

<ROUTINE CONFIRM-YES? (PROMPT "AUX" LEN POS C1 C2 C3)
  <TELL .PROMPT>
  <PREPARE-BUFFERS>
  <READ ,INBUF ,LEXBUF>
  <COND
    (<0? <WORD-COUNT>>
      <RFALSE>)>
  <SET LEN <GETB ,LEXBUF 4>>
  <SET POS <GETB ,LEXBUF 5>>
  <SET C1 <GETB ,INBUF .POS>>
  <COND
    (<AND <EQUAL? .LEN 1> <RAW-LETTER? .C1 121 89>>
      <RTRUE>)
    (<EQUAL? .LEN 3>
      <SET C2 <GETB ,INBUF <+ .POS 1>>>
      <SET C3 <GETB ,INBUF <+ .POS 2>>>
      <COND
        (<AND
          <RAW-LETTER? .C1 121 89>
          <RAW-LETTER? .C2 101 69>
          <RAW-LETTER? .C3 115 83>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (T
      <RFALSE>)>>

<ROUTINE DO-QUIT ()
  <COND
    (<CONFIRM-YES? "Quit? (Y/YES) >">
      <QUIT>)
    (T
      <TELL "Not quit." CR>)>
  <RTRUE>>

<ROUTINE DO-RESTART ()
  <COND
    (<CONFIRM-YES? "Restart? (Y/YES) >">
      <TELL "Restarting." CR CR>
      <SOFT-RESTART>)
    (T
      <TELL "Not restarted." CR>)>
  <RTRUE>>

<ROUTINE PREPARE-BUFFERS ()
  <PUTB ,INBUF 0 78>
  <PUTB ,LEXBUF 0 16>
  <PUTB ,LEXBUF 1 0>>

<ROUTINE GO ()
  <SETG IN-CONSOLE <>>
  <PREPARE-BUFFERS>
  <CRLF> <CRLF>
  <CRLF>
  <INIT-START-ROOM>
  <INTRO>
  <GAME-TITLE>
  <GAME-BYLINE>
  <PRINT-BANNER>
  <CRLF>
  <TELL
"Type HELP for a list of commands." CR CR>

  <INIT-GAME>
  <DESCRIBE-ROOM>
  <MAIN-LOOP>>

<ROUTINE MAIN-LOOP ()
  <REPEAT ()
    <COND (,GAME-OVER <RETURN>)>

    <COND (,SEPARATE-PROMPT <CRLF>)>
    <COND
      (,IN-CONSOLE <TELL "*">)
      (T <TELL ">">)>
    <READ ,INBUF ,LEXBUF>
    <SETG SEPARATE-PROMPT <NOT <0? <WORD-COUNT>>>>

    <COND
      (<HANDLE-STANDARD-COMMAND>)
      (T
        <TELL "I don't understand that." CR>)>>>

<ROUTINE WORD-COUNT ()
  <GETB ,LEXBUF 1>>

<ROUTINE WORD-PTR (N "AUX" CNT)
  <SET CNT <WORD-COUNT>>
  <COND
    (<OR <L? .N 1> <G? .N .CNT>>
      <RETURN 0>)
    (T
      <RETURN <GET ,LEXBUF <+ <* <- .N 1> 2> 1>>>)>>

<ROUTINE BUZZ-WORD? (W)
  <OR
    <EQUAL? .W ,W?THE>
    <EQUAL? .W ,W?A>
    <EQUAL? .W ,W?AN>
    <EQUAL? .W ,W?AT>
    <EQUAL? .W ,W?TO>
    <EQUAL? .W ,W?OF>
    <EQUAL? .W ,W?WITH>
    <EQUAL? .W ,W?USING>
    <EQUAL? .W ,W?ON>>>

<ROUTINE SIG-WORD (ORD "AUX" CNT I W SEEN)
  <SET CNT <WORD-COUNT>>
  <SET I 1>
  <SET SEEN 0>

  <REPEAT ()
    <COND
      (<G? .I .CNT>
        <RETURN 0>)>

    <SET W <WORD-PTR .I>>

    <COND
      (<OR <0? .W> <BUZZ-WORD? .W>>)
      (T
        <SET SEEN <+ .SEEN 1>>
        <COND
          (<EQUAL? .SEEN .ORD>
            <RETURN .W>)>)>

    <SET I <+ .I 1>>>>

<ROUTINE CMD-WORD1 ()
  <SIG-WORD 1>>

<ROUTINE CMD-WORD2 ()
  <SIG-WORD 2>>

<ROUTINE CMD-WORD3 ()
  <SIG-WORD 3>>

<ROUTINE CMD-WORD4 ()
  <SIG-WORD 4>>

<ROUTINE CMD-WORD5 ()
  <SIG-WORD 5>>

<ROUTINE RAW-WORD1 ()
  <WORD-PTR 1>>

<ROUTINE RAW-WORD2 ()
  <WORD-PTR 2>>

<ROUTINE RAW-LETTER? (C L U)
  <OR <EQUAL? .C .L> <EQUAL? .C .U>>>

<ROUTINE RAW-END? (C)
  <OR <0? .C> <EQUAL? .C 32>>>

<ROUTINE WORD-TO-DIR (W)
  <COND
    (<OR
      <EQUAL? .W ,W?NORTH>
      <EQUAL? .W ,W?N>>
      <RETURN ,P?NORTH>)
    (<OR
      <EQUAL? .W ,W?SOUTH>
      <EQUAL? .W ,W?S>>
      <RETURN ,P?SOUTH>)
    (<OR
      <EQUAL? .W ,W?EAST>
      <EQUAL? .W ,W?E>>
      <RETURN ,P?EAST>)
    (<OR
      <EQUAL? .W ,W?WEST>
      <EQUAL? .W ,W?W>>
      <RETURN ,P?WEST>)
    (<OR
      <EQUAL? .W ,W?UP>
      <EQUAL? .W ,W?U>>
      <RETURN ,P?UP>)
    (<OR
      <EQUAL? .W ,W?DOWN>
      <EQUAL? .W ,W?D>>
      <RETURN ,P?DOWN>)
    (<OR
      <EQUAL? .W ,W?IN>
      <EQUAL? .W ,W?INSIDE>>
      <RETURN ,P?IN>)
    (<OR
      <EQUAL? .W ,W?OUT>
      <EQUAL? .W ,W?OUTSIDE>>
      <RETURN ,P?OUT>)
    (T
      <RETURN 0>)>>


"HOOKS REQUIRED FROM GAME FILE"
"GAME-HANDLE-RAW-COMMAND, GAME-HANDLE-COMMAND, GAME-WORD-TO-OBJ-PHRASE,"
"GAME-IMPLIED-OBJECT, WORD-TO-OBJ, EXIT-BLOCKED?, AFTER-MOVE,"
"BEFORE-TURN, AFTER-TURN, GAME-HANDLE-CONSOLE-COMMAND,"
"INIT-START-ROOM, INIT-GAME, GAME-TITLE, GAME-BYLINE, DESCRIBE-ROOM, and action routines."

<ROUTINE WORD-TO-OBJ-SAFE (W2 W3 "AUX" O)
  <SET O <GAME-WORD-TO-OBJ-PHRASE .W2 .W3>>
  <COND
    (<NOT <EQUAL? .O ,OBJ-NONE>>
      <RETURN .O>)>
  <SET O <WORD-TO-OBJ .W2>>
  <COND
    (<EQUAL? .O ,OBJ-NONE>
      <SET O <WORD-TO-OBJ .W3>>)>
  <RETURN .O>>

<ROUTINE SET-LAST-OBJECT (OBJ)
  <COND
    (<NOT <EQUAL? .OBJ ,OBJ-NONE>>
      <SETG LAST-OBJECT .OBJ>)>>

<ROUTINE INC-TURN ()
  <SETG TURNS <+ ,TURNS 1>>>

<ROUTINE BEGIN-TURN (VERB)
  <INC-TURN>
  <BEFORE-TURN .VERB>>

<ROUTINE DICE-NUMBER ("AUX" LEN POS I C N)
  <COND
    (<0? <WORD-COUNT>>
      <RETURN -1>)>
  <SET LEN <GETB ,LEXBUF 4>>
  <SET POS <GETB ,LEXBUF 5>>
  <COND
    (<OR <0? .LEN> <0? .POS>>
      <RETURN -1>)>
  <SET I 0>
  <SET N 0>
  <REPEAT ()
    <COND
      (<EQUAL? .I .LEN>
        <RETURN .N>)>
    <SET C <GETB ,INBUF <+ .POS .I>>>
    <COND
      (<OR <L? .C 48> <G? .C 57>>
        <RETURN -1>)>
    <SET N <+ <* .N 10> <- .C 48>>>
    <SET I <+ .I 1>>>>

<ROUTINE MANUAL-ROLL (MIN MAX PROMPT "AUX" N)
  <REPEAT ()
    <TELL .PROMPT>
    <PREPARE-BUFFERS>
    <READ ,INBUF ,LEXBUF>
    <SET N <DICE-NUMBER>>
    <COND
      (<AND <NOT <L? .N .MIN>> <NOT <G? .N .MAX>>>
        <RETURN .N>)
      (T
        <TELL "Please enter a number from " N .MIN " to " N .MAX "." CR>)>>>

<ROUTINE ROLL-D6 (PROMPT)
  <COND
    (,MANUAL-DICE
      <MANUAL-ROLL 1 6 .PROMPT>)
    (T
      <RANDOM 6>)>>

<ROUTINE ROLL-2D6 (PROMPT)
  <COND
    (,MANUAL-DICE
      <MANUAL-ROLL 2 12 .PROMPT>)
    (T
      <+ <RANDOM 6> <RANDOM 6>>)>>

<ROUTINE DO-DICE ()
  <COND
    (,MANUAL-DICE
      <SETG MANUAL-DICE <>>
      <TELL "Automatic dice rolls are now on." CR>)
    (T
      <SETG MANUAL-DICE T>
      <TELL "Manual dice rolls are now on. Roll real dice and type the result
when asked." CR>
      <TELL "For manual starting attributes, type RESTART now." CR>)>>

<ROUTINE DO-HELP ()
  <TELL
"Available commands:" CR
"  LOOK/L" CR
"  EXAMINE/X/C <object>" CR
"  SEARCH/SEA [room]" CR
"  EXITS/EX" CR
"  INVENTORY/I" CR
CR
"  TAKE/GET/G <object>" CR
"  TAKE/GET/G ALL" CR
"  DROP <object>" CR
"  DROP ALL" CR
"  GIVE <object> TO <npc>" CR
"  DRINK <object>" CR
CR
"  OPEN/O <object>" CR
"  CLOSE/CL <object>" CR
"  UNLOCK <object> WITH <object>" CR
"  USE <object> [ON <object>]" CR
"  LIGHT <object>" CR
"  TURN ON <object>" CR
"  TURN OFF <object>" CR
CR
"  TALK TO <npc>" CR
"  KILL/K [npc]" CR
"  WAIT/Z" CR
CR
"  A (attributes)" CR
"  RPG (RPG attributes rules)" CR
"  DICE (toggle manual/automatic dice rolls)" CR
"  CONSOLE/CON (engine console; password required; Q exits)" CR
CR
"  SAVE" CR
"  RESTORE" CR
"  RESTART" CR
"  QUIT/Q" CR
"  HELP/H" CR
CR
"Movement:" CR
"  NORTH/N" CR
"  SOUTH/S" CR
"  EAST/E" CR
"  WEST/W" CR
"  UP/U" CR
"  DOWN/D" CR 
"  IN" CR
"  OUT" CR>>

<ROUTINE SAY-EXIT (DIR NAME)
  <COND
    (<GETP ,ROOM .DIR>
      <COND
        (<0? ,EXIT-COUNT>
          <TELL .NAME>)
        (T
          <TELL ", " .NAME>)>
      <SETG EXIT-COUNT <+ ,EXIT-COUNT 1>>)>>

<ROUTINE DO-EXITS ()
  <SETG EXIT-COUNT 0>
  <TELL "Exits: ">
  <SAY-EXIT ,P?NORTH "north">
  <SAY-EXIT ,P?SOUTH "south">
  <SAY-EXIT ,P?EAST "east">
  <SAY-EXIT ,P?WEST "west">
  <SAY-EXIT ,P?UP "up">
  <SAY-EXIT ,P?DOWN "down">
  <SAY-EXIT ,P?IN "in">
  <SAY-EXIT ,P?OUT "out">
  <COND
    (<0? ,EXIT-COUNT>
      <TELL "none">)>
  <TELL "." CR>>


<ROUTINE DO-WAIT ()
  <TELL "Time passes..." CR>>

<ROUTINE DO-SAVE ()
  <COND
    (<SAVE>
      <TELL "Ok." CR>)
    (T
      <TELL "Save failed." CR>)>>

<ROUTINE DO-RESTORE ()
  <COND
    (<RESTORE>
      <TELL "Ok." CR>
      <DESCRIBE-ROOM>)
    (T
      <TELL "Restore failed." CR>)>>

<ROUTINE EXIT-ROOM (FROM DIR "AUX" NR)
  <SET NR <GETP .FROM .DIR>>
  <COND
    (<0? .NR>
      <RETURN ,NOWHERE>)
    (<EXIT-BLOCKED? .FROM .DIR>
      <RETURN ,NOWHERE>)
    (T
      <RETURN .NR>)>>

<ROUTINE DO-MOVE (DIR "AUX" NR)
  <SET NR <EXIT-ROOM ,ROOM .DIR>>
  <COND
    (<0? .NR>
      <COND
        (<0? <GETP ,ROOM .DIR>>
          <TELL "You cannot go that way." CR>)>
      <RTRUE>)
    (T
      <SETG ROOM .NR>
      <AFTER-MOVE>
      <DESCRIBE-ROOM>
      <RTRUE>)>>

<ROUTINE SYS-VEC? (C N "AUX" L)
  <SET L .C>
  <COND
    (<AND <G? .L 64> <L? .L 91>>
      <SET L <+ .L 32>>)>
  <COND
    (<EQUAL? .N 1> <EQUAL? <- .L 100> 22>)
    (<EQUAL? .N 2> <EQUAL? <- .L 100> 11>)
    (<EQUAL? .N 3> <EQUAL? <- .L 100> 14>)
    (<EQUAL? .N 4> <EQUAL? <- .L 100> 7>)
    (T <RFALSE>)>>

<ROUTINE SYS-VEC-S? ("AUX" LEN POS)
  <TELL "PASSWORD:">
  <PREPARE-BUFFERS>
  <READ ,INBUF ,LEXBUF>
  <COND
    (<NOT <EQUAL? <WORD-COUNT> 1>>
      <RFALSE>)>
  <SET LEN <GETB ,LEXBUF 4>>
  <SET POS <GETB ,LEXBUF 5>>
  <COND
    (<NOT <EQUAL? .LEN 4>>
      <RFALSE>)
    (<AND
      <SYS-VEC? <GETB ,INBUF .POS> 1>
      <SYS-VEC? <GETB ,INBUF <+ .POS 1>> 2>
      <SYS-VEC? <GETB ,INBUF <+ .POS 2>> 3>
      <SYS-VEC? <GETB ,INBUF <+ .POS 3>> 4>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE ENTER-CONSOLE ()
  <COND
    (,IN-CONSOLE
      <TELL "503 MONITOR ALREADY ACTIVE." CR>)
    (<SYS-VEC-S?>
      <SETG IN-CONSOLE T>
      <TELL "220 SYS MONITOR READY. Q=RTS." CR>)
    (T
      <TELL "530 LOGIN INCORRECT." CR>)>
  <RTRUE>>

<ROUTINE HANDLE-CONSOLE-COMMAND (IGNORED "AUX" W1 W2)
  <SET W1 <RAW-WORD1>>
  <SET W2 <RAW-WORD2>>
  <COND
    (<0? <WORD-COUNT>>
      <RTRUE>)
    (<OR
      <EQUAL? .W1 ,W?Q>
      <EQUAL? .W1 ,W?QUIT>>
      <SETG IN-CONSOLE <>>
      <TELL "221 RTS." CR>
      <RTRUE>)
    (<OR
      <EQUAL? .W1 ,W?CONSOLE>
      <EQUAL? .W1 ,W?CON>>
      <TELL "503 MONITOR ALREADY ACTIVE." CR>
      <RTRUE>)
    (<GAME-HANDLE-CONSOLE-COMMAND .W1 .W2>
      <RTRUE>)
    (T
      <TELL "500 ILLEGAL OPCODE." CR>
      <RTRUE>)>>

<ROUTINE HANDLE-STANDARD-COMMAND ("AUX" RW1 W1 W2 W3 W4 W5 D O O2)
  <SET RW1 <RAW-WORD1>>
  <SET W1 <CMD-WORD1>>
  <SET W2 <CMD-WORD2>>
  <SET W3 <CMD-WORD3>>
  <SET W4 <CMD-WORD4>>
  <SET W5 <CMD-WORD5>>

  <COND
    (,IN-CONSOLE
      <HANDLE-CONSOLE-COMMAND .W1>
      <RTRUE>)

    (<GAME-HANDLE-RAW-COMMAND>
      <RTRUE>)

    (<GAME-HANDLE-COMMAND .RW1 .W1 .W2>
      <RTRUE>)

    (<0? .W1>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?LOOK>
      <EQUAL? .W1 ,W?L>>
      <BEGIN-TURN .W1>
      <DO-LOOK>
      <AFTER-TURN .W1>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?INVENTORY>
      <EQUAL? .W1 ,W?I>>
      <DO-INVENTORY>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?WAIT>
      <EQUAL? .W1 ,W?Z>>
      <BEGIN-TURN .W1>
      <DO-WAIT>
      <AFTER-TURN .W1>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?TALK>
      <EQUAL? .W1 ,W?SPEAK>>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <SET O <GAME-IMPLIED-OBJECT .W1>>)>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Talk to whom?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-TALK .O>
          <AFTER-TURN .W1>)>
      <RTRUE>)


    (<EQUAL? .W1 ,W?DICE>
      <DO-DICE>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?CONSOLE>
      <EQUAL? .W1 ,W?CON>>
      <ENTER-CONSOLE>
      <RTRUE>)


    (<OR
      <EQUAL? .W1 ,W?HELP>
      <EQUAL? .W1 ,W?H>>
      <DO-HELP>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?EXITS>
      <EQUAL? .W1 ,W?XITS>
      <EQUAL? .W1 ,W?EX>>
      <DO-EXITS>
      <RTRUE>)

    (<EQUAL? .W1 ,W?SAVE>
      <DO-SAVE>
      <RTRUE>)

    (<EQUAL? .W1 ,W?RESTORE>
      <DO-RESTORE>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?QUIT>
      <EQUAL? .W1 ,W?Q>>
      <DO-QUIT>
      <RTRUE>)

   (<EQUAL? .W1 ,W?RESTART>
      <DO-RESTART>
      <RTRUE>)

    (<SET D <WORD-TO-DIR .W1>>
      <BEGIN-TURN .W1>
      <DO-MOVE .D>
      <AFTER-TURN .W1>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?WALK>
      <EQUAL? .W1 ,W?GO>>
      <SET D <WORD-TO-DIR .W2>>
      <COND
        (.D
          <BEGIN-TURN .W1>
          <DO-MOVE .D>
          <AFTER-TURN .W1>)
        (T
          <TELL "Go where?" CR>)>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?EXAMINE>
      <EQUAL? .W1 ,W?X>
      <EQUAL? .W1 ,W?C>>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Examine what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-EXAMINE .O>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?TAKE>
      <EQUAL? .W1 ,W?GET>
      <EQUAL? .W1 ,W?G>>
      <COND
        (<EQUAL? .W2 ,W?ALL>
          <BEGIN-TURN .W1>
          <DO-TAKE-ALL>
          <AFTER-TURN .W1>)
        (T
          <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
          <COND
            (<EQUAL? .O ,OBJ-NONE>
              <TELL "Take what?" CR>)
            (T
              <BEGIN-TURN .W1>
              <SET-LAST-OBJECT .O>
              <DO-TAKE .O>
              <AFTER-TURN .W1>)>)>
      <RTRUE>)

    (<EQUAL? .W1 ,W?DROP>
      <COND
        (<EQUAL? .W2 ,W?ALL>
          <BEGIN-TURN .W1>
          <DO-DROP-ALL>
          <AFTER-TURN .W1>)
        (T
          <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
          <COND
            (<EQUAL? .O ,OBJ-NONE>
              <TELL "Drop what?" CR>)
            (T
              <BEGIN-TURN .W1>
              <SET-LAST-OBJECT .O>
              <DO-DROP .O>
              <AFTER-TURN .W1>)>)>
      <RTRUE>)

    (<EQUAL? .W1 ,W?GIVE>
      <SET O <GAME-WORD-TO-OBJ-PHRASE .W2 .W3>>
      <COND
        (<AND <NOT <EQUAL? .O ,OBJ-NONE>> <NOT <0? .W4>>>
          <SET O2 <WORD-TO-OBJ-SAFE .W4 .W5>>)
        (T
          <COND
            (<EQUAL? .W2 ,W?WATER>
              <SET O ,OBJ-FLASK>)
            (T
              <SET O <WORD-TO-OBJ .W2>>)>
          <SET O2 <WORD-TO-OBJ-SAFE .W3 .W4>>)>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Give what?" CR>)
        (<EQUAL? .O2 ,OBJ-NONE>
          <TELL "Give it to whom?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-GIVE .O .O2>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<EQUAL? .W1 ,W?DRINK>
      <COND
        (<EQUAL? .W2 ,W?WATER>
          <SET O ,OBJ-FLASK>)
        (T
          <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>)>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Drink what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-DRINK .O>
          <AFTER-TURN .W1>)>
      <RTRUE>)


    (<OR
      <EQUAL? .W1 ,W?KILL>
      <EQUAL? .W1 ,W?K>>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <SET O <GAME-IMPLIED-OBJECT .W1>>)>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Kill what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-KILL .O>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?OPEN>
      <EQUAL? .W1 ,W?O>>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Open what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-OPEN .O>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?CLOSE>
      <EQUAL? .W1 ,W?CL>>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Close what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-CLOSE .O>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<EQUAL? .W1 ,W?UNLOCK>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <SET O2 <WORD-TO-OBJ .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Unlock what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-UNLOCK .O .O2>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<EQUAL? .W1 ,W?USE>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <SET O2 <WORD-TO-OBJ .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Use what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-USE .O .O2>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<EQUAL? .W1 ,W?TURN>
      <COND
        (<EQUAL? .W2 ,W?OFF>
          <SET O <WORD-TO-OBJ .W3>>
          <COND
            (<EQUAL? .O ,OBJ-NONE>
              <TELL "Turn off what?" CR>)
            (T
              <BEGIN-TURN .W1>
              <SET-LAST-OBJECT .O>
              <DO-TURN-OFF .O>
              <AFTER-TURN .W1>)>)
        (T
          <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
          <COND
            (<EQUAL? .O ,OBJ-NONE>
              <TELL "Turn what?" CR>)
            (T
              <BEGIN-TURN .W1>
              <SET-LAST-OBJECT .O>
              <DO-TURN .O>
              <AFTER-TURN .W1>)>)>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?LIGHT>
      <EQUAL? .W1 ,W?IGNITE>>
      <SET O <WORD-TO-OBJ-SAFE .W2 .W3>>
      <COND
        (<EQUAL? .O ,OBJ-NONE>
          <TELL "Light what?" CR>)
        (T
          <BEGIN-TURN .W1>
          <SET-LAST-OBJECT .O>
          <DO-LIGHT .O>
          <AFTER-TURN .W1>)>
      <RTRUE>)

    (<OR
      <EQUAL? .W1 ,W?SEARCH>
      <EQUAL? .W1 ,W?SEA>>
       <SET O <WORD-TO-OBJ .W2>>
       <BEGIN-TURN .W1>
       <DO-SEARCH .O>
       <AFTER-TURN .W1>
       <RTRUE>)

    (T
      <RFALSE>)>>

<ROUTINE PRINT-BANNER ("AUX" (CNT 17))
    <TELL "Release ">
    <PRINTN <BAND <GET 0 1> *3777*>>
    <TELL " / Serial number ">
    <REPEAT ()
        <COND (<G? <SET CNT <+ .CNT 1>> 23>
               <RETURN>)
              (T
               <PRINTC <GETB 0 .CNT>>)>>
    <CRLF>>
