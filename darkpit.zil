"Dark Pit"
"Copyright (c) 2026 Andy Kosela"
"MIT License"

<VERSION ZIP>
<CONSTANT RELEASEID 0>

<INSERT-FILE "minilib.zil">

"GAME OBJECT IDS"
<CONSTANT OBJ-LAMP 1>
<CONSTANT OBJ-KEY 2>
<CONSTANT OBJ-GATE 3>
<CONSTANT OBJ-ROOM 4>
<CONSTANT OBJ-SELF 5>
<CONSTANT OBJ-GUARD 6>
<CONSTANT OBJ-CORPSE 7>
<CONSTANT OBJ-HELMET 8>
<CONSTANT OBJ-CHAINMAIL 9>
<CONSTANT OBJ-SWORD 10>
<CONSTANT OBJ-GUARD-SWORD 11>
<CONSTANT OBJ-OLD-MAN 12>
<CONSTANT OBJ-CELL-DOOR 13>
<CONSTANT OBJ-RING 14>
<CONSTANT OBJ-LEVER 15>
<CONSTANT OBJ-GEM 16>
<CONSTANT OBJ-STONE-DOOR 17>
<CONSTANT OBJ-CHAINS 18>
<CONSTANT OBJ-BONE 19>
<CONSTANT OBJ-CHISEL 20>
<CONSTANT OBJ-FLASK 21>
<CONSTANT OBJ-BACKPACK 22>

"GAME STATE"
<GLOBAL LAMP-PLACE 0>
<GLOBAL KEY-PLACE 0>
<GLOBAL LAMP-LIT <>>
<GLOBAL GATE-UNLOCKED <>>
<GLOBAL GATE-OPEN <>>
<GLOBAL GUARD-PLACE 0>
<GLOBAL GUARD-ALERT <>>
<GLOBAL GUARD-FOLLOWING <>>
<GLOBAL GUARD-THREATENING <>>
<GLOBAL GUARD-W 0>
<GLOBAL GUARD-HP 6>
<GLOBAL GUARD-AP 3>
<GLOBAL GUARD-DEAD <>>
<GLOBAL CORPSE-PLACE 0>
<GLOBAL HELMET-PLACE 0>
<GLOBAL CHAINMAIL-PLACE 0>
<GLOBAL SWORD-PLACE 0>
<GLOBAL GUARD-SWORD-PLACE 0>
<GLOBAL OLD-SWORD-TAKEN <>>
<GLOBAL GUARD-LOOT-REVEALED <>>
<GLOBAL OLD-MAN-DEAD <>>
<GLOBAL OLD-MAN-TALKED <>>
<GLOBAL CELL-DOOR-OPEN <>>
<GLOBAL STONE-DOOR-OPEN <>>
<GLOBAL RING-PLACE 0>
<GLOBAL LEVER-REVEALED <>>
<GLOBAL CISTERN-DRAINED <>>
<GLOBAL GEM-PLACE 0>
<GLOBAL PLAYER-CHAINED T>
<GLOBAL BONE-PLACE 0>
<GLOBAL CHISEL-PLACE 0>
<GLOBAL FLASK-PLACE 0>
<GLOBAL BACKPACK-PLACE 0>
<GLOBAL OLD-MAN-GOT-WATER <>>
<GLOBAL GEM-LOOSENED <>>
<GLOBAL SPEAR-TRAP-SEEN <>>
<GLOBAL SPEAR-TRAP-SPRUNG <>>
<GLOBAL PIT-TRAP-SEEN <>>
<GLOBAL PIT-TRAP-SPRUNG <>>
<GLOBAL DART-TRAP-SEEN <>>
<GLOBAL DART-TRAP-SPRUNG <>>

"RPG ATTRIBUTES"
<GLOBAL ATTR-S 0>
<GLOBAL ATTR-D 0>
<GLOBAL ATTR-K 0>
<GLOBAL ATTR-W 0>
<GLOBAL HP 6>
<GLOBAL AP 0>

"ROOM TREE"
<OBJECT ROOMS
  (DESC "Rooms")>

"ROOM DEFINITIONS"
<ROOM RM-CELL
  (LOC ROOMS)
  (DESC "Dungeon Cell")
  (SYNONYM CELL ROOM DUNGEON)
  (NORTH TO RM-HALL)>

<ROOM RM-HALL
  (LOC ROOMS)
  (DESC "Dungeon Hall")
  (SYNONYM HALL ROOM DUNGEON)
  (SOUTH TO RM-CELL)
  (WEST TO RM-ARMORY)
  (EAST TO RM-CORRIDOR)>

<ROOM RM-ARMORY
  (LOC ROOMS)
  (DESC "Old Armory")
  (SYNONYM ARMORY ROOM)
  (NORTH TO RM-NICHE)
  (EAST TO RM-HALL)>

<ROOM RM-CORRIDOR
  (LOC ROOMS)
  (DESC "East Corridor")
  (SYNONYM CORRIDOR PASSAGE)
  (WEST TO RM-HALL)
  (NORTH TO RM-ALCOVE)
  (EAST TO RM-GUARDROOM)>

<ROOM RM-ALCOVE
  (LOC ROOMS)
  (DESC "Dark Alcove")
  (SYNONYM ALCOVE ROOM)
  (SOUTH TO RM-CORRIDOR)>

<ROOM RM-GUARDROOM
  (LOC ROOMS)
  (DESC "Guard Room")
  (SYNONYM GUARD ROOM)
  (WEST TO RM-CORRIDOR)
  (UP TO RM-COURTYARD)>

<ROOM RM-COURTYARD
  (LOC ROOMS)
  (DESC "Moonlit Courtyard")
  (SYNONYM COURT YARD)
  (DOWN TO RM-GUARDROOM)>

<ROOM RM-NICHE
  (LOC ROOMS)
  (DESC "Hidden Niche")
  (SYNONYM NICHE)
  (SOUTH TO RM-ARMORY)
  (EAST TO RM-VAULT)>

<ROOM RM-VAULT
  (LOC ROOMS)
  (DESC "Sunken Vault")
  (SYNONYM VAULT ROOM)
  (WEST TO RM-NICHE)
  (DOWN TO RM-SERPENT-STAIR)>

<ROOM RM-SERPENT-STAIR
  (LOC ROOMS)
  (DESC "Serpent Stair")
  (SYNONYM STAIR STEPS)
  (UP TO RM-VAULT)
  (DOWN TO RM-SPEAR-HALL)>

<ROOM RM-SPEAR-HALL
  (LOC ROOMS)
  (DESC "Hall of Spears")
  (SYNONYM HALL SPEARS)
  (UP TO RM-SERPENT-STAIR)
  (EAST TO RM-PIT-BRIDGE)>

<ROOM RM-PIT-BRIDGE
  (LOC ROOMS)
  (DESC "Bridge of Skulls")
  (SYNONYM BRIDGE PIT)
  (WEST TO RM-SPEAR-HALL)
  (EAST TO RM-BONE-CHAMBER)>

<ROOM RM-BONE-CHAMBER
  (LOC ROOMS)
  (DESC "Chamber of Bones")
  (SYNONYM CHAMBER BONES)
  (WEST TO RM-PIT-BRIDGE)
  (DOWN TO RM-CISTERN)>

<ROOM RM-CISTERN
  (LOC ROOMS)
  (DESC "Well of Black Waters")
  (SYNONYM CISTERN WATER WELL)
  (UP TO RM-BONE-CHAMBER)
  (EAST TO RM-SHRINE)>

<ROOM RM-SHRINE
  (LOC ROOMS)
  (DESC "Forgotten Shrine")
  (SYNONYM SHRINE CHAPEL)
  (WEST TO RM-CISTERN)>


"THING VOCABULARY OBJECTS"
<OBJECT LAMP-OBJ
  (DESC "brass lamp")
  (SYNONYM LAMP)
  (ADJECTIVE BRASS)>

<OBJECT KEY-OBJ
  (DESC "rusty key")
  (SYNONYM KEY)
  (ADJECTIVE RUSTY)>

<OBJECT FLASK-OBJ
  (DESC "flask of water")
  (SYNONYM FLASK BOTTLE)
  (ADJECTIVE WATER)>

<OBJECT BACKPACK-OBJ
  (DESC "leather backpack")
  (SYNONYM BACKPACK PACK RUCKSACK)
  (ADJECTIVE OLD)>

<OBJECT GATE-OBJ
  (DESC "iron gate")
  (SYNONYM GATE)
  (ADJECTIVE IRON LOCKED)>

<OBJECT CELL-DOOR-OBJ
  (DESC "cell door")
  (SYNONYM DOOR)
  (ADJECTIVE CELL HEAVY)>

<OBJECT CHAINS-OBJ
  (DESC "iron chains")
  (SYNONYM CHAINS IRONS FETTERS PIN)
  (ADJECTIVE IRON RUSTY)>

<OBJECT BONE-OBJ
  (DESC "jagged bone")
  (SYNONYM BONE)
  (ADJECTIVE JAGGED)>

<OBJECT ROOM-WORDS-OBJ
  (DESC "room words")
  (SYNONYM FLOOR WALL STRAW)>

<OBJECT MISC-WORDS-OBJ
  (DESC "misc words")
  (SYNONYM LOCK BARS CEILING WATER)>

<OBJECT ALL-WORDS-OBJ
  (DESC "all words")
  (SYNONYM ALL)>

<OBJECT SELF-OBJ
  (DESC "yourself")
  (SYNONYM ME MYSELF SELF IT)>

<OBJECT GUARD-OBJ
  (DESC "guard")
  (SYNONYM GUARD MAN SOLDIER)>

<OBJECT GUARD-CORPSE-OBJ
  (DESC "dead guard")
  (SYNONYM CORPSE BODY GUARD)
  (ADJECTIVE DEAD)>

<OBJECT HELMET-OBJ
  (DESC "dented iron helmet")
  (SYNONYM HELMET HELM)
  (ADJECTIVE DENTED IRON)>

<OBJECT CHAINMAIL-OBJ
  (DESC "dark chainmail")
  (SYNONYM CHAIN MAIL ARMOR ARMOUR)
  (ADJECTIVE DARK)>

<OBJECT SWORD-OBJ
  (DESC "old sword")
  (SYNONYM SWORD BLADE WEAPON)
  (ADJECTIVE OLD PLAIN)>

<OBJECT GUARD-SWORD-OBJ
  (DESC "guard's sword")
  (SYNONYM SWORD BLADE WEAPON)
  (ADJECTIVE GUARD)>

<OBJECT RING-OBJ
  (DESC "iron ring")
  (SYNONYM RING HANDLE)
  (ADJECTIVE IRON)>

<OBJECT LEVER-OBJ
  (DESC "rusted lever")
  (SYNONYM LEVER)
  (ADJECTIVE RUSTED)>

<OBJECT GEM-OBJ
  (DESC "black gem")
  (SYNONYM GEM JEWEL)
  (ADJECTIVE BLACK)>

<OBJECT CHISEL-OBJ
  (DESC "green bronze chisel")
  (SYNONYM CHISEL WEDGE TOOL)
  (ADJECTIVE GREEN BRONZE)>

<OBJECT STONE-DOOR-OBJ
  (DESC "stone slab")
  (SYNONYM SLAB STONE DOOR)
  (ADJECTIVE SECRET)>

<OBJECT SHRINE-WORDS-OBJ
  (DESC "shrine words")
  (SYNONYM ALTAR IDOL ARCH GRATE)>


"RPG ATTRIBUTE HELPERS"

<ROUTINE ATTR-FROM-ROLL (R)
  <COND
    (<L? .R 5>
      <RETURN -1>)
    (<L? .R 9>
      <RETURN 0>)
    (<L? .R 11>
      <RETURN 1>)
    (T
      <RETURN 2>)>>

<ROUTINE ROLL-ATTR (PROMPT)
  <ATTR-FROM-ROLL <ROLL-2D6 .PROMPT>>>

<ROUTINE ROLL-ATTRIBUTES ()
  <SETG ATTR-S <ROLL-ATTR "Roll 2d6 for Strength/S (2-12): ">>
  <SETG ATTR-D <ROLL-ATTR "Roll 2d6 for Dexterity/D (2-12): ">>
  <SETG ATTR-K <ROLL-ATTR "Roll 2d6 for Knowledge/K (2-12): ">>
  <SETG ATTR-W <ROLL-ATTR "Roll 2d6 for Weapon/W (2-12): ">>
  <SETG HP <+ 6 ,ATTR-S>>
  <DO-ATTRIBUTES>>

<ROUTINE DO-ATTRIBUTES ()
  <TELL "S:" N ,ATTR-S ", D:" N ,ATTR-D ", K:" N ,ATTR-K ", W:" N ,ATTR-W ", HP:" N ,HP ", AP:" N ,AP CR>>

<ROUTINE SAY-STRENGTH (N)
  <COND
    (<EQUAL? .N -1> <TELL "weak">)
    (<0? .N> <TELL "average">)
    (<EQUAL? .N 1> <TELL "strong">)
    (T <TELL "very strong">)>>

<ROUTINE SAY-DEXTERITY (N)
  <COND
    (<EQUAL? .N -1> <TELL "clumsy">)
    (<0? .N> <TELL "average">)
    (<EQUAL? .N 1> <TELL "quick">)
    (T <TELL "very quick">)>>

<ROUTINE SAY-KNOWLEDGE (N)
  <COND
    (<EQUAL? .N -1> <TELL "ignorant">)
    (<0? .N> <TELL "average">)
    (<EQUAL? .N 1> <TELL "learned">)
    (T <TELL "very learned">)>>

<ROUTINE SAY-WEAPON (N)
  <COND
    (<EQUAL? .N -1> <TELL "poor">)
    (<0? .N> <TELL "average">)
    (<EQUAL? .N 1> <TELL "skilled">)
    (T <TELL "expert">)>>

<ROUTINE DO-RPG ()
  <TELL "DarkRPG system" CR>
  <TELL "--------------" CR>
  <TELL "RPG attributes are rolled with 2d6 at game start." CR>
  <TELL "  2-4: -1, 5-8: 0, 9-10: 1, 11-12: 2." CR CR>
  <TELL "S is strength. It shows how strong the character is and changes HP." CR>
  <TELL "Your S is " N ,ATTR-S " (">
  <SAY-STRENGTH ,ATTR-S>
  <TELL ")." CR>
  <TELL "D is dexterity. It shows how quick and agile the character is." CR>
  <TELL "Your D is " N ,ATTR-D " (">
  <SAY-DEXTERITY ,ATTR-D>
  <TELL ")." CR>
  <TELL "K is knowledge. It shows what study, learning and practical understanding the character has." CR>
  <TELL "Your K is " N ,ATTR-K " (">
  <SAY-KNOWLEDGE ,ATTR-K>
  <TELL ")." CR>
  <TELL "W is weapon skill. It shows how well the character uses weapons." CR>
  <TELL "Your W is " N ,ATTR-W " (">
  <SAY-WEAPON ,ATTR-W>
  <TELL ")." CR>
  <TELL "HP is health points: 6 + S. Your HP is " N ,HP "." CR>
  <TELL "AP is armor points. Your AP is " N ,AP "." CR>>

"GAME INITIALIZATION"
<ROUTINE INIT-START-ROOM ()
  <SETG ROOM ,RM-CELL>
  <RTRUE>>

<ROUTINE INIT-GAME ()
  <SETG ROOM ,RM-CELL>
  <SETG TURNS 0>
  <ROLL-ATTRIBUTES>
  <SETG LAMP-PLACE ,RM-ARMORY>
  <SETG KEY-PLACE ,RM-ALCOVE>
  <SETG LAMP-LIT <>>
  <SETG GATE-UNLOCKED <>>
  <SETG GATE-OPEN <>>
  <SETG GUARD-PLACE ,RM-CORRIDOR>
  <SETG GUARD-ALERT <>>
  <SETG GUARD-FOLLOWING <>>
  <SETG GUARD-THREATENING <>>
  <SETG GUARD-W 0>
  <SETG GUARD-HP 6>
  <SETG GUARD-AP 3>
  <SETG GUARD-DEAD <>>
  <SETG CORPSE-PLACE ,NOWHERE>
  <SETG HELMET-PLACE ,NOWHERE>
  <SETG CHAINMAIL-PLACE ,NOWHERE>
  <SETG SWORD-PLACE ,RM-ARMORY>
  <SETG GUARD-SWORD-PLACE ,NOWHERE>
  <SETG OLD-SWORD-TAKEN <>>
  <SETG GUARD-LOOT-REVEALED <>>
  <SETG OLD-MAN-DEAD <>>
  <SETG OLD-MAN-TALKED <>>
  <SETG CELL-DOOR-OPEN <>>
  <SETG STONE-DOOR-OPEN <>>
  <SETG RING-PLACE ,NOWHERE>
  <SETG LEVER-REVEALED <>>
  <SETG CISTERN-DRAINED <>>
  <SETG GEM-PLACE ,RM-SHRINE>
  <SETG GEM-LOOSENED <>>
  <SETG PLAYER-CHAINED T>
  <SETG BONE-PLACE ,NOWHERE>
  <SETG CHISEL-PLACE ,NOWHERE>
  <SETG FLASK-PLACE ,RM-ARMORY>
  <SETG BACKPACK-PLACE ,RM-ARMORY>
  <SETG OLD-MAN-GOT-WATER <>>
  <SETG SPEAR-TRAP-SEEN <>>
  <SETG SPEAR-TRAP-SPRUNG <>>
  <SETG PIT-TRAP-SEEN <>>
  <SETG PIT-TRAP-SPRUNG <>>
  <SETG DART-TRAP-SEEN <>>
  <SETG DART-TRAP-SPRUNG <>>
  <SETG AP 0>
  <SETG GAME-OVER <>>
  <SETG FIRST-LOOK T>
  <SETG LAST-OBJECT ,OBJ-NONE>
  <SETG SEPARATE-PROMPT T>>

<ROUTINE GAME-TITLE ()
  <TELL "DARK PIT" CR>>

<ROUTINE GAME-BYLINE ()
  <TELL "A dungeon adventure demo" CR "Authored by Andy Kosela" CR>>

<ROUTINE INTRO ()
  <TELL "You remember the red night in fragments: the reek of wine, the clash
of bronze cups, and the laughter of thieves beneath the smoke-black rafters of
the Wolf's Jaw." CR CR>
  <TELL "A woman with eyes like wet jet had sold you a map to the buried vaults
of old Khoraz, where kings before history sealed their tribute under stone and
curse. You followed it through alleys foul with mist, and there the city watch
came on you like hounds. Steel flashed. Men died. Then a club, black and sudden
as doom, broke the world into sparks." CR CR>
  <TELL "You woke with blood dried in your hair and iron on your wrists. They
named you murderer, grave-robber, and spy, though the dead had drawn first. By
dawn they flung you into this pit below the keep, where the stones sweat and
rats whisper in the straw." CR CR>
  <TELL "Yet the map is not lost. Its last sign burns in your memory: a black
shrine beneath the prison, and a jewel men called the Night-Eye. If the gods
have not spat you out entirely, you may yet break your chains, find the jewel,
and carve a road back to the moonlit world." CR CR CR>>

"GAME-SPECIFIC PARSER HOOKS"
<ROUTINE RAW-TALK-COMMAND? ("AUX" I C)
  <SET I 1>
  <REPEAT ()
    <COND
      (<G? .I 78>
        <RFALSE>)>
    <SET C <GETB ,INBUF .I>>
    <COND
      (<EQUAL? .C 32>
        <SET I <+ .I 1>>)
      (T
        <RETURN>)>>

  <COND
    (<AND
      <RAW-LETTER? <GETB ,INBUF .I> 116 84>
      <RAW-LETTER? <GETB ,INBUF <+ .I 1>> 97 65>
      <RAW-LETTER? <GETB ,INBUF <+ .I 2>> 108 76>
      <RAW-LETTER? <GETB ,INBUF <+ .I 3>> 107 75>
      <RAW-END? <GETB ,INBUF <+ .I 4>>>>
      <RTRUE>)
    (<AND
      <RAW-LETTER? <GETB ,INBUF .I> 115 83>
      <RAW-LETTER? <GETB ,INBUF <+ .I 1>> 112 80>
      <RAW-LETTER? <GETB ,INBUF <+ .I 2>> 101 69>
      <RAW-LETTER? <GETB ,INBUF <+ .I 3>> 97 65>
      <RAW-LETTER? <GETB ,INBUF <+ .I 4>> 107 75>
      <RAW-END? <GETB ,INBUF <+ .I 5>>>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE RAW-HAS-OLD-MAN? ("AUX" I C)
  <SET I 1>
  <REPEAT ()
    <COND
      (<G? .I 76>
        <RFALSE>)>
    <SET C <GETB ,INBUF .I>>
    <COND
      (<0? .C>
        <RFALSE>)
      (<AND
        <RAW-LETTER? .C 111 79>
        <RAW-LETTER? <GETB ,INBUF <+ .I 1>> 108 76>
        <RAW-LETTER? <GETB ,INBUF <+ .I 2>> 100 68>>
        <RTRUE>)
      (<AND
        <RAW-LETTER? .C 109 77>
        <RAW-LETTER? <GETB ,INBUF <+ .I 1>> 97 65>
        <RAW-LETTER? <GETB ,INBUF <+ .I 2>> 110 78>>
        <RTRUE>)>
    <SET I <+ .I 1>>>>

<ROUTINE HANDLE-RAW-TALK ()
  <COND
    (<RAW-HAS-OLD-MAN?>
      <COND
        (<NOT <OLD-MAN-HERE?>>
          <TELL "The old man is not here." CR>)
        (T
          <BEGIN-TURN 0>
          <SET-LAST-OBJECT ,OBJ-OLD-MAN>
          <DO-TALK ,OBJ-OLD-MAN>
          <AFTER-TURN 0>)>)
    (<OLD-MAN-HERE?>
      <BEGIN-TURN 0>
      <SET-LAST-OBJECT ,OBJ-OLD-MAN>
      <DO-TALK ,OBJ-OLD-MAN>
      <AFTER-TURN 0>)
    (<GUARD-HERE?>
      <BEGIN-TURN 0>
      <SET-LAST-OBJECT ,OBJ-GUARD>
      <DO-TALK ,OBJ-GUARD>
      <AFTER-TURN 0>)
    (T
      <TELL "Talk to whom?" CR>)>>

<ROUTINE GAME-HANDLE-RAW-COMMAND ()
  <COND
    (<RAW-TALK-COMMAND?>
      <HANDLE-RAW-TALK>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE GAME-HANDLE-COMMAND (RW1 W1 W2)
  <COND
    (<AND <EQUAL? .RW1 ,W?A> <EQUAL? <WORD-COUNT> 1>>
      <DO-ATTRIBUTES>
      <RTRUE>)
    (<EQUAL? .W1 ,W?RPG>
      <DO-RPG>
      <RTRUE>)
    (T
      <RFALSE>)>>


"ENGINE CONSOLE MONITOR"
<ROUTINE CON-BOOL (TXT FLAG)
  <TELL "213 " .TXT>
  <COND
    (.FLAG <TELL "=1" CR>)
    (T <TELL "=0" CR>)>>

<ROUTINE CON-MNEM-TO-ROOM (W)
  <COND
    (<EQUAL? .W ,W?CEL> <RETURN ,RM-CELL>)
    (<EQUAL? .W ,W?HAL> <RETURN ,RM-HALL>)
    (<EQUAL? .W ,W?ARM> <RETURN ,RM-ARMORY>)
    (<EQUAL? .W ,W?COR> <RETURN ,RM-CORRIDOR>)
    (<EQUAL? .W ,W?GRD> <RETURN ,RM-GUARDROOM>)
    (<EQUAL? .W ,W?ALC> <RETURN ,RM-ALCOVE>)
    (<EQUAL? .W ,W?NIC> <RETURN ,RM-NICHE>)
    (<EQUAL? .W ,W?CRT> <RETURN ,RM-COURTYARD>)
    (<EQUAL? .W ,W?VLT> <RETURN ,RM-VAULT>)
    (<EQUAL? .W ,W?STA> <RETURN ,RM-SERPENT-STAIR>)
    (<EQUAL? .W ,W?SPR> <RETURN ,RM-SPEAR-HALL>)
    (<EQUAL? .W ,W?BRG> <RETURN ,RM-PIT-BRIDGE>)
    (<EQUAL? .W ,W?BON> <RETURN ,RM-BONE-CHAMBER>)
    (<EQUAL? .W ,W?WEL> <RETURN ,RM-CISTERN>)
    (<EQUAL? .W ,W?SHR> <RETURN ,RM-SHRINE>)
    (T <RETURN 0>)>>

<ROUTINE CON-MNEM-TO-OBJ (W)
  <COND
    (<EQUAL? .W ,W?LMP> <RETURN ,OBJ-LAMP>)
    (<EQUAL? .W ,W?KEY> <RETURN ,OBJ-KEY>)
    (<EQUAL? .W ,W?SWD> <RETURN ,OBJ-SWORD>)
    (<EQUAL? .W ,W?GSW> <RETURN ,OBJ-GUARD-SWORD>)
    (<EQUAL? .W ,W?HEL> <RETURN ,OBJ-HELMET>)
    (<EQUAL? .W ,W?MAL> <RETURN ,OBJ-CHAINMAIL>)
    (<EQUAL? .W ,W?GEM> <RETURN ,OBJ-GEM>)
    (<EQUAL? .W ,W?BON> <RETURN ,OBJ-BONE>)
    (<EQUAL? .W ,W?CHS> <RETURN ,OBJ-CHISEL>)
    (<EQUAL? .W ,W?BPK> <RETURN ,OBJ-BACKPACK>)
    (<EQUAL? .W ,W?FLA> <RETURN ,OBJ-FLASK>)
    (T <RETURN ,OBJ-NONE>)>>

<ROUTINE CON-HELP ()
  <TELL
"OPCODES:" CR
" HLP dir        WHE pwd/stat" CR
" FLG flag dump  ROM symtab" CR
" GOT <addr>     GET <file>" CR
" DRP <file>     HEA patch hp" CR
" HUR dec hp     KIL kill proc" CR
" OPN chmod/open FRE clear lock" CR
" DRN drain fs   LIT lamp on" CR
" DUS lamp off   REV probe" CR
" Q rts          FIL symtab" CR
CR
"214 ADDR CEL HAL ARM COR GRD ALC NIC CRT VLT STA SPR BRG BON WEL SHR" CR
"214 FILE BON BPK CHS FLA GEM GSW HEL KEY LMP MAL SWD" CR
"211 END" CR>>

<ROUTINE CON-WHERE ()
  <TELL "257 CWD="><PRINTD ,ROOM><CRLF>
  <TELL "213 TURNS=" N ,TURNS " HP=" N ,HP " AP=" N ,AP CR>
  <TELL "213 S=" N ,ATTR-S " D=" N ,ATTR-D " K=" N ,ATTR-K " W=" N ,ATTR-W CR>
  <COND
    (,LAMP-LIT <TELL "213 LAMP=LIT" CR>)
    (T <TELL "213 LAMP=DARK" CR>)>
  <COND
    (,GUARD-DEAD <TELL "213 GUARD=DEAD" CR>)
    (T <TELL "213 GUARD-HP=" N ,GUARD-HP CR>)>>

<ROUTINE CON-FLAGS ()
  <CON-BOOL "CHAINED" ,PLAYER-CHAINED>
  <CON-BOOL "CELL-DOOR" ,CELL-DOOR-OPEN>
  <CON-BOOL "GATE-UNLOCKED" ,GATE-UNLOCKED>
  <CON-BOOL "GATE-OPEN" ,GATE-OPEN>
  <CON-BOOL "STONE-DOOR" ,STONE-DOOR-OPEN>
  <CON-BOOL "LEVER-REVEALED" ,LEVER-REVEALED>
  <CON-BOOL "CISTERN-DRAINED" ,CISTERN-DRAINED>
  <CON-BOOL "GEM-LOOSENED" ,GEM-LOOSENED>
  <CON-BOOL "GUARD-DEAD" ,GUARD-DEAD>
  <CON-BOOL "SPEAR-SEEN" ,SPEAR-TRAP-SEEN>
  <CON-BOOL "PIT-SEEN" ,PIT-TRAP-SEEN>
  <CON-BOOL "DART-SEEN" ,DART-TRAP-SEEN>>

<ROUTINE CON-ROOMS ()
  <TELL
"212-CEL RM-CELL" CR
"212-HAL RM-HALL" CR
"212-ARM RM-ARMORY" CR
"212-COR RM-CORRIDOR" CR
"212-GRD RM-GUARDROOM" CR
"212-ALC RM-ALCOVE" CR
"212-NIC RM-NICHE" CR
"212-CRT RM-COURTYARD" CR
"212-VLT RM-VAULT" CR
"212-STA RM-SERPENT-STAIR" CR
"212-SPR RM-SPEAR-HALL" CR
"212-BRG RM-PIT-BRIDGE" CR
"212-BON RM-BONE-CHAMBER" CR
"212-WEL RM-CISTERN" CR
"212 SHR RM-SHRINE" CR>>

<ROUTINE CON-FILES ()
  <TELL
"215-BON OBJ-BONE" CR
"215-BPK OBJ-BACKPACK" CR
"215-CHS OBJ-CHISEL" CR
"215-FLA OBJ-FLASK" CR
"215-GEM OBJ-GEM" CR
"215-GSW OBJ-GUARD-SWORD" CR
"215-HEL OBJ-HELMET" CR
"215-KEY OBJ-KEY" CR
"215-LMP OBJ-LAMP" CR
"215-MAL OBJ-CHAINMAIL" CR
"215-SWD OBJ-SWORD" CR>>

<ROUTINE CON-GOTO (W "AUX" R)
  <SET R <CON-MNEM-TO-ROOM .W>>
  <COND
    (<0? .R>
      <TELL "501 BAD ADDRESS. USE ROM." CR>)
    (T
      <SETG ROOM .R>
      <SETG FIRST-LOOK T>
      <TELL "250 CWD OK." CR>)>>

<ROUTINE CON-ADD-AP (N)
  <SETG AP <+ ,AP .N>>>

<ROUTINE CON-SUB-AP (N)
  <COND
    (<L? ,AP .N> <SETG AP 0>)
    (T <SETG AP <- ,AP .N>>)>>

<ROUTINE CON-GET (W "AUX" O WAS)
  <SET O <CON-MNEM-TO-OBJ .W>>
  <COND
    (<EQUAL? .O ,OBJ-NONE>
      <TELL "501 BAD OBJECT." CR>)
    (T
      <SET WAS <OBJ-PLACE .O>>
      <COND
        (<EQUAL? .O ,OBJ-GEM> <SETG GEM-LOOSENED T>)>
      <SET-OBJ-PLACE .O ,INVENTORY>
      <COND
        (<AND <EQUAL? .O ,OBJ-HELMET> <NOT <EQUAL? .WAS ,INVENTORY>>>
          <CON-ADD-AP 1>)
        (<AND <EQUAL? .O ,OBJ-CHAINMAIL> <NOT <EQUAL? .WAS ,INVENTORY>>>
          <CON-ADD-AP 2>)>
      <TELL "226 RETR OK." CR>)>>

<ROUTINE CON-DROP (W "AUX" O WAS)
  <SET O <CON-MNEM-TO-OBJ .W>>
  <COND
    (<EQUAL? .O ,OBJ-NONE>
      <TELL "501 BAD OBJECT." CR>)
    (T
      <SET WAS <OBJ-PLACE .O>>
      <COND
        (<AND <EQUAL? .O ,OBJ-HELMET> <EQUAL? .WAS ,INVENTORY>>
          <CON-SUB-AP 1>)
        (<AND <EQUAL? .O ,OBJ-CHAINMAIL> <EQUAL? .WAS ,INVENTORY>>
          <CON-SUB-AP 2>)>
      <SET-OBJ-PLACE .O ,ROOM>
      <TELL "250 STOR OK." CR>)>>

<ROUTINE CON-HEAL ()
  <SETG HP <+ 6 ,ATTR-S>>
  <COND
    (<L? ,HP 1> <SETG HP 1>)>
  <TELL "200 HP=" N ,HP CR>>

<ROUTINE CON-HURT ()
  <COND
    (<L? ,HP 2>
      <TELL "550 HP UNDERFLOW." CR>)
    (T
      <SETG HP <- ,HP 1>>
      <TELL "200 HP=" N ,HP CR>)>>

<ROUTINE CON-KILL ()
  <COND
    (,GUARD-DEAD
      <TELL "550 GUARD ALREADY STOPPED." CR>)
    (T
      <SETG GUARD-HP 0>
      <SETG GUARD-DEAD T>
      <SETG CORPSE-PLACE ,ROOM>
      <SETG GUARD-PLACE ,NOWHERE>
      <SETG GUARD-ALERT <>>
      <SETG GUARD-FOLLOWING <>>
      <SETG GUARD-THREATENING <>>
      <TELL "226 GUARD PROCESS TERMINATED." CR>)>>

<ROUTINE CON-OPEN ()
  <COND
    (<OR <EQUAL? ,ROOM ,RM-CELL> <EQUAL? ,ROOM ,RM-HALL>>
      <SETG CELL-DOOR-OPEN T>
      <TELL "250 CELL-DOOR=OPEN." CR>)
    (<OR <EQUAL? ,ROOM ,RM-CORRIDOR> <EQUAL? ,ROOM ,RM-GUARDROOM>>
      <SETG GATE-UNLOCKED T>
      <SETG GATE-OPEN T>
      <TELL "250 GATE=OPEN." CR>)
    (<OR <EQUAL? ,ROOM ,RM-NICHE> <EQUAL? ,ROOM ,RM-VAULT>>
      <SETG STONE-DOOR-OPEN T>
      <TELL "250 STONE-DOOR=OPEN." CR>)
    (<EQUAL? ,ROOM ,RM-CISTERN>
      <SETG LEVER-REVEALED T>
      <SETG CISTERN-DRAINED T>
      <TELL "250 CISTERN=PASSABLE." CR>)
    (T
      <SETG CELL-DOOR-OPEN T>
      <SETG GATE-UNLOCKED T>
      <SETG GATE-OPEN T>
      <SETG STONE-DOOR-OPEN T>
      <SETG LEVER-REVEALED T>
      <SETG CISTERN-DRAINED T>
      <TELL "250 BARRIER FLAGS PATCHED." CR>)>>

<ROUTINE CON-FREE ()
  <SETG PLAYER-CHAINED <>>
  <TELL "200 CHAIN=0." CR>>

<ROUTINE CON-DRAIN ()
  <SETG LEVER-REVEALED T>
  <SETG CISTERN-DRAINED T>
  <TELL "200 CISTERN=DRAINED." CR>>

<ROUTINE CON-LIGHT ()
  <SETG LAMP-PLACE ,INVENTORY>
  <SETG LAMP-LIT T>
  <TELL "200 LAMP=LIT." CR>>

<ROUTINE CON-DARK ()
  <SETG LAMP-LIT <>>
  <TELL "200 LAMP=DARK." CR>>

<ROUTINE CON-REVEAL ()
  <COND
    (<EQUAL? ,ROOM ,RM-CELL>
      <SETG BONE-PLACE ,RM-CELL>
      <TELL "226 BONE=VISIBLE." CR>)
    (<EQUAL? ,ROOM ,RM-NICHE>
      <SETG RING-PLACE ,RM-NICHE>
      <TELL "226 RING=VISIBLE." CR>)
    (<EQUAL? ,ROOM ,RM-SPEAR-HALL>
      <SETG SPEAR-TRAP-SEEN T>
      <TELL "226 SPEAR-TRAP=MARKED." CR>)
    (<EQUAL? ,ROOM ,RM-PIT-BRIDGE>
      <SETG PIT-TRAP-SEEN T>
      <TELL "226 PIT-TRAP=MARKED." CR>)
    (<EQUAL? ,ROOM ,RM-BONE-CHAMBER>
      <SETG DART-TRAP-SEEN T>
      <COND
        (<EQUAL? ,CHISEL-PLACE ,NOWHERE>
          <SETG CHISEL-PLACE ,RM-BONE-CHAMBER>)>
      <TELL "226 DART-TRAP=MARKED; CHISEL=VISIBLE." CR>)
    (<EQUAL? ,ROOM ,RM-CISTERN>
      <SETG LEVER-REVEALED T>
      <TELL "226 LEVER=VISIBLE." CR>)
    (<EQUAL? ,ROOM ,RM-SHRINE>
      <SETG GEM-LOOSENED T>
      <TELL "226 GEM=READY." CR>)
    (T
      <TELL "550 NO LOCAL MATCH." CR>)>>

<ROUTINE GAME-HANDLE-CONSOLE-COMMAND (W1 W2)
  <COND
    (<EQUAL? .W1 ,W?HLP> <CON-HELP> <RTRUE>)
    (<EQUAL? .W1 ,W?WHE> <CON-WHERE> <RTRUE>)
    (<EQUAL? .W1 ,W?FLG> <CON-FLAGS> <RTRUE>)
    (<EQUAL? .W1 ,W?ROM> <CON-ROOMS> <RTRUE>)
    (<EQUAL? .W1 ,W?FIL> <CON-FILES> <RTRUE>)
    (<EQUAL? .W1 ,W?GOT> <CON-GOTO .W2> <RTRUE>)
    (<EQUAL? .W1 ,W?GET> <CON-GET .W2> <RTRUE>)
    (<EQUAL? .W1 ,W?DRP> <CON-DROP .W2> <RTRUE>)
    (<EQUAL? .W1 ,W?HEA> <CON-HEAL> <RTRUE>)
    (<EQUAL? .W1 ,W?HUR> <CON-HURT> <RTRUE>)
    (<EQUAL? .W1 ,W?KIL> <CON-KILL> <RTRUE>)
    (<EQUAL? .W1 ,W?OPN> <CON-OPEN> <RTRUE>)
    (<EQUAL? .W1 ,W?FRE> <CON-FREE> <RTRUE>)
    (<EQUAL? .W1 ,W?DRN> <CON-DRAIN> <RTRUE>)
    (<EQUAL? .W1 ,W?LIT> <CON-LIGHT> <RTRUE>)
    (<EQUAL? .W1 ,W?DUS> <CON-DARK> <RTRUE>)
    (<EQUAL? .W1 ,W?REV> <CON-REVEAL> <RTRUE>)
    (T <RFALSE>)>>

<ROUTINE SWORD-NOUN? (W)
  <COND
    (<OR
      <EQUAL? .W ,W?SWORD>
      <EQUAL? .W ,W?BLADE>
      <EQUAL? .W ,W?WEAPON>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE GAME-WORD-TO-OBJ-PHRASE (W2 W3)
  <COND
    (<AND
      <EQUAL? .W2 ,W?OLD>
      <EQUAL? .W3 ,W?MAN>>
      <RETURN ,OBJ-OLD-MAN>)
    (<AND
      <OR <EQUAL? .W2 ,W?OLD> <EQUAL? .W2 ,W?PLAIN>>
      <SWORD-NOUN? .W3>>
      <RETURN ,OBJ-SWORD>)
    (<AND
      <EQUAL? .W2 ,W?GUARD>
      <SWORD-NOUN? .W3>>
      <RETURN ,OBJ-GUARD-SWORD>)
    (<AND
      <EQUAL? .W2 ,W?IRON>
      <OR <EQUAL? .W3 ,W?CHAINS> <EQUAL? .W3 ,W?IRONS> <EQUAL? .W3 ,W?FETTERS> <EQUAL? .W3 ,W?PIN>>>
      <RETURN ,OBJ-CHAINS>)
    (<AND
      <EQUAL? .W2 ,W?JAGGED>
      <EQUAL? .W3 ,W?BONE>>
      <RETURN ,OBJ-BONE>)
    (<AND
      <EQUAL? .W2 ,W?IRON>
      <OR <EQUAL? .W3 ,W?RING> <EQUAL? .W3 ,W?HANDLE>>>
      <RETURN ,OBJ-RING>)
    (<AND
      <EQUAL? .W2 ,W?BLACK>
      <OR <EQUAL? .W3 ,W?GEM> <EQUAL? .W3 ,W?JEWEL>>>
      <RETURN ,OBJ-GEM>)
    (<AND
      <OR <EQUAL? .W2 ,W?GREEN> <EQUAL? .W2 ,W?BRONZE>>
      <OR <EQUAL? .W3 ,W?CHISEL> <EQUAL? .W3 ,W?WEDGE> <EQUAL? .W3 ,W?TOOL>>>
      <RETURN ,OBJ-CHISEL>)
    (<AND
      <EQUAL? .W2 ,W?STONE>
      <OR <EQUAL? .W3 ,W?SLAB> <EQUAL? .W3 ,W?DOOR>>>
      <RETURN ,OBJ-STONE-DOOR>)
    (<AND
      <OR <EQUAL? .W2 ,W?WATER> <EQUAL? .W2 ,W?FLASK> <EQUAL? .W2 ,W?BOTTLE>>
      <OR <EQUAL? .W3 ,W?FLASK> <EQUAL? .W3 ,W?BOTTLE> <EQUAL? .W3 ,W?WATER>>>
      <RETURN ,OBJ-FLASK>)
    (<AND
      <EQUAL? .W2 ,W?OLD>
      <OR <EQUAL? .W3 ,W?BACKPACK> <EQUAL? .W3 ,W?PACK> <EQUAL? .W3 ,W?RUCKSACK>>>
      <RETURN ,OBJ-BACKPACK>)
    (T
      <RETURN ,OBJ-NONE>)>>

<ROUTINE GAME-IMPLIED-OBJECT (VERB)
  <COND
    (<AND
      <OR <EQUAL? .VERB ,W?KILL> <EQUAL? .VERB ,W?K>>
      <EQUAL? <WORD-COUNT> 1>
      <GUARD-HERE?>
      <OR <NOT <OLD-MAN-HERE?>> ,OLD-MAN-DEAD>>
      <RETURN ,OBJ-GUARD>)
    (<AND
      <OR <EQUAL? .VERB ,W?KILL> <EQUAL? .VERB ,W?K>>
      <EQUAL? <WORD-COUNT> 1>
      <OLD-MAN-HERE?>
      <NOT ,OLD-MAN-DEAD>
      <NOT <GUARD-HERE?>>>
      <RETURN ,OBJ-OLD-MAN>)
    (<AND
      <OR <EQUAL? .VERB ,W?TALK> <EQUAL? .VERB ,W?SPEAK>>
      <EQUAL? <WORD-COUNT> 1>
      <OLD-MAN-HERE?>
      <NOT ,OLD-MAN-DEAD>
      <NOT <GUARD-HERE?>>>
      <RETURN ,OBJ-OLD-MAN>)
    (<AND
      <OR <EQUAL? .VERB ,W?TALK> <EQUAL? .VERB ,W?SPEAK>>
      <EQUAL? <WORD-COUNT> 1>
      <GUARD-HERE?>>
      <RETURN ,OBJ-GUARD>)
    (T
      <RETURN ,OBJ-NONE>)>>

"PARSER HOOK FOR GAME OBJECTS"
<ROUTINE WORD-TO-OBJ (W)
  <COND
    (<EQUAL? .W ,W?IT>
      <RETURN ,LAST-OBJECT>)
    (<EQUAL? .W ,W?LAMP>
      <RETURN ,OBJ-LAMP>)
    (<EQUAL? .W ,W?KEY>
      <RETURN ,OBJ-KEY>)
    (<OR <EQUAL? .W ,W?FLASK> <EQUAL? .W ,W?BOTTLE>>
      <RETURN ,OBJ-FLASK>)
    (<OR <EQUAL? .W ,W?BACKPACK> <EQUAL? .W ,W?PACK> <EQUAL? .W ,W?RUCKSACK>>
      <RETURN ,OBJ-BACKPACK>)
    (<EQUAL? .W ,W?BONE>
      <RETURN ,OBJ-BONE>)
    (<OR
      <EQUAL? .W ,W?CHAINS>
      <EQUAL? .W ,W?IRONS>
      <EQUAL? .W ,W?FETTERS>
      <EQUAL? .W ,W?PIN>>
      <RETURN ,OBJ-CHAINS>)
    (<EQUAL? .W ,W?DOOR>
      <COND
        (<CELL-DOOR-HERE?>
          <RETURN ,OBJ-CELL-DOOR>)
        (<STONE-DOOR-HERE?>
          <RETURN ,OBJ-STONE-DOOR>)
        (T
          <RETURN ,OBJ-GATE>)>)
    (<OR <EQUAL? .W ,W?SLAB> <EQUAL? .W ,W?ARCH> <EQUAL? .W ,W?GRATE>>
      <COND
        (<STONE-DOOR-HERE?>
          <RETURN ,OBJ-STONE-DOOR>)
        (T
          <RETURN ,OBJ-ROOM>)>)
    (<OR <EQUAL? .W ,W?RING> <EQUAL? .W ,W?HANDLE>>
      <RETURN ,OBJ-RING>)
    (<EQUAL? .W ,W?LEVER>
      <RETURN ,OBJ-LEVER>)
    (<OR <EQUAL? .W ,W?GEM> <EQUAL? .W ,W?JEWEL>>
      <RETURN ,OBJ-GEM>)
    (<OR <EQUAL? .W ,W?CHISEL> <EQUAL? .W ,W?WEDGE> <EQUAL? .W ,W?TOOL>>
      <RETURN ,OBJ-CHISEL>)
    (<EQUAL? .W ,W?ALTAR>
      <RETURN ,OBJ-ROOM>)
    (<OR
      <EQUAL? .W ,W?GATE>
      <EQUAL? .W ,W?LOCK>
      <EQUAL? .W ,W?BARS>>
      <RETURN ,OBJ-GATE>)
    (<OR
      <EQUAL? .W ,W?ROOM>
      <EQUAL? .W ,W?CELL>
      <EQUAL? .W ,W?HALL>
      <EQUAL? .W ,W?ARMORY>
      <EQUAL? .W ,W?CORRIDOR>
      <EQUAL? .W ,W?PASSAGE>
      <EQUAL? .W ,W?ALCOVE>
      <EQUAL? .W ,W?NICHE>
      <EQUAL? .W ,W?VAULT>
      <EQUAL? .W ,W?STAIR>
      <EQUAL? .W ,W?STEPS>
      <EQUAL? .W ,W?SPEARS>
      <EQUAL? .W ,W?BRIDGE>
      <EQUAL? .W ,W?PIT>
      <EQUAL? .W ,W?CHAMBER>
      <EQUAL? .W ,W?BONES>
      <EQUAL? .W ,W?CISTERN>
      <EQUAL? .W ,W?WELL>
      <EQUAL? .W ,W?SHRINE>
      <EQUAL? .W ,W?CHAPEL>
      <EQUAL? .W ,W?YARD>
      <EQUAL? .W ,W?DUNGEON>
      <EQUAL? .W ,W?FLOOR>
      <EQUAL? .W ,W?WALL>
      <EQUAL? .W ,W?STRAW>
      <EQUAL? .W ,W?CEILING>
      <EQUAL? .W ,W?WATER>>
      <RETURN ,OBJ-ROOM>)
    (<EQUAL? .W ,W?OLD>
      <RETURN ,OBJ-OLD-MAN>)
    (<EQUAL? .W ,W?MAN>
      <COND
        (<OLD-MAN-HERE?>
          <RETURN ,OBJ-OLD-MAN>)
        (<AND ,GUARD-DEAD <EQUAL? ,CORPSE-PLACE ,ROOM>>
          <RETURN ,OBJ-CORPSE>)
        (T
          <RETURN ,OBJ-GUARD>)>)
    (<OR
      <EQUAL? .W ,W?GUARD>
      <EQUAL? .W ,W?SOLDIER>>
      <COND
        (<AND ,GUARD-DEAD <EQUAL? ,CORPSE-PLACE ,ROOM>>
          <RETURN ,OBJ-CORPSE>)
        (T
          <RETURN ,OBJ-GUARD>)>)
    (<OR
      <EQUAL? .W ,W?CORPSE>
      <EQUAL? .W ,W?BODY>
      <EQUAL? .W ,W?DEAD>>
      <RETURN ,OBJ-CORPSE>)
    (<OR
      <EQUAL? .W ,W?HELMET>
      <EQUAL? .W ,W?HELM>>
      <RETURN ,OBJ-HELMET>)
    (<EQUAL? .W ,W?CHAIN>
      <COND
        (<EQUAL? ,ROOM ,RM-CELL>
          <RETURN ,OBJ-CHAINS>)
        (T
          <RETURN ,OBJ-CHAINMAIL>)>)
    (<OR
      <EQUAL? .W ,W?MAIL>
      <EQUAL? .W ,W?ARMOR>
      <EQUAL? .W ,W?ARMOUR>>
      <RETURN ,OBJ-CHAINMAIL>)
    (<OR
      <EQUAL? .W ,W?SWORD>
      <EQUAL? .W ,W?BLADE>
      <EQUAL? .W ,W?WEAPON>>
      <COND
        (<EQUAL? ,SWORD-PLACE ,INVENTORY>
          <RETURN ,OBJ-SWORD>)
        (<EQUAL? ,GUARD-SWORD-PLACE ,INVENTORY>
          <RETURN ,OBJ-GUARD-SWORD>)
        (<EQUAL? ,GUARD-SWORD-PLACE ,ROOM>
          <RETURN ,OBJ-GUARD-SWORD>)
        (<EQUAL? ,SWORD-PLACE ,ROOM>
          <RETURN ,OBJ-SWORD>)
        (T
          <RETURN ,OBJ-SWORD>)>)
    (<OR
      <EQUAL? .W ,W?ME>
      <EQUAL? .W ,W?MYSELF>
      <EQUAL? .W ,W?SELF>>
      <RETURN ,OBJ-SELF>)
    (T
      <RETURN ,OBJ-NONE>)>>

"ROOM AND LIGHT HELPERS"
<ROUTINE ROOM-NAME ()
  <PRINTD ,ROOM>>

<ROUTINE LAMP-HERE? ()
  <COND
    (<OR
      <EQUAL? ,LAMP-PLACE ,ROOM>
      <EQUAL? ,LAMP-PLACE ,INVENTORY>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE LIGHT-HERE? ()
  <COND
    (<AND ,LAMP-LIT <LAMP-HERE?>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE DEEP-DUNGEON? ()
  <COND
    (<OR
      <EQUAL? ,ROOM ,RM-VAULT>
      <EQUAL? ,ROOM ,RM-SERPENT-STAIR>
      <EQUAL? ,ROOM ,RM-SPEAR-HALL>
      <EQUAL? ,ROOM ,RM-PIT-BRIDGE>
      <EQUAL? ,ROOM ,RM-BONE-CHAMBER>
      <EQUAL? ,ROOM ,RM-CISTERN>
      <EQUAL? ,ROOM ,RM-SHRINE>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE DARK-ROOM? ()
  <COND
    (<AND <EQUAL? ,ROOM ,RM-ALCOVE> <NOT <LIGHT-HERE?>>>
      <RTRUE>)
    (<AND <DEEP-DUNGEON?> <NOT <LIGHT-HERE?>>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE GATE-HERE? ()
  <COND
    (<OR
      <EQUAL? ,ROOM ,RM-CORRIDOR>
      <EQUAL? ,ROOM ,RM-GUARDROOM>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE CELL-DOOR-HERE? ()
  <COND
    (<OR
      <EQUAL? ,ROOM ,RM-CELL>
      <EQUAL? ,ROOM ,RM-HALL>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE STONE-DOOR-HERE? ()
  <COND
    (<OR
      <EQUAL? ,ROOM ,RM-NICHE>
      <EQUAL? ,ROOM ,RM-VAULT>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE LEVER-HERE? ()
  <COND
    (<AND ,LEVER-REVEALED <EQUAL? ,ROOM ,RM-CISTERN>>
      <RTRUE>)
    (T
      <RFALSE>)>>

"GUARD HELPERS"
<ROUTINE GUARD-HERE? ()
  <COND
    (<AND <NOT ,GUARD-DEAD> <EQUAL? ,GUARD-PLACE ,ROOM>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE GUARD-SHOUTS ()
  <TELL "The guard shouts, \"Stop right there, criminal scum!\"" CR>>

<ROUTINE NOTICE-GUARD ()
  <COND
    (<GUARD-HERE?>
      <COND
        (,GUARD-FOLLOWING
          <TELL "A grim guard runs after you." CR>)
        (<EQUAL? ,ROOM ,RM-CORRIDOR>
          <TELL "A grim guard stands by the iron gate." CR>)
        (T
          <TELL "A grim guard stands here." CR>)>
      <SETG GUARD-ALERT T>
      <GUARD-SHOUTS>)>>

<ROUTINE MOVE-GUARD-AFTER-PLAYER-MOVE ()
  <COND
    (<AND <NOT ,GUARD-DEAD> ,GUARD-ALERT <NOT <EQUAL? ,GUARD-PLACE ,ROOM>>>
      <SETG GUARD-PLACE ,ROOM>
      <SETG GUARD-FOLLOWING T>)>>

<ROUTINE CORPSE-HERE? ()
  <COND
    (<AND ,GUARD-DEAD <EQUAL? ,CORPSE-PLACE ,ROOM>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE REVEAL-GUARD-LOOT ()
  <COND
    (<NOT ,GUARD-LOOT-REVEALED>
      <SETG GUARD-LOOT-REVEALED T>
      <SETG HELMET-PLACE ,ROOM>
      <SETG CHAINMAIL-PLACE ,ROOM>
      <SETG GUARD-SWORD-PLACE ,ROOM>
      <TELL "On the corpse you find a dented iron helmet, a shirt of dark chainmail, and a sword." CR>)
    (T
      <TELL "The dead guard has already yielded his gear." CR>)>>

"OLD MAN HELPERS"
<ROUTINE OLD-MAN-HERE? ()
  <COND
    (<EQUAL? ,ROOM ,RM-CELL>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE NOTICE-OLD-MAN ()
  <COND
    (<OLD-MAN-HERE?>
      <COND
        (,OLD-MAN-DEAD
          <TELL "The old man lies dead in the rotten straw." CR>)
        (T
          <TELL "An old man sits hunched in the rotten straw." CR>)>)>>

<ROUTINE READ-MENU-CHOICE ("AUX" LEN POS C)
  <PREPARE-BUFFERS>
  <READ ,INBUF ,LEXBUF>
  <COND
    (<0? <WORD-COUNT>>
      <RETURN 0>)>
  <SET LEN <GETB ,LEXBUF 4>>
  <SET POS <GETB ,LEXBUF 5>>
  <SET C <GETB ,INBUF .POS>>
  <COND
    (<AND <EQUAL? .LEN 1> <RAW-LETTER? .C 97 65>>
      <RETURN 1>)
    (<AND <EQUAL? .LEN 1> <RAW-LETTER? .C 98 66>>
      <RETURN 2>)
    (<AND <EQUAL? .LEN 1> <RAW-LETTER? .C 99 67>>
      <RETURN 3>)
    (<AND <EQUAL? .LEN 1> <RAW-LETTER? .C 100 68>>
      <RETURN 4>)
    (T
      <RETURN 0>)>>

<ROUTINE DO-TALK (OBJ)
  <COND
    (<EQUAL? .OBJ ,OBJ-OLD-MAN>
      <DO-TALK-OLD-MAN>)
    (<EQUAL? .OBJ ,OBJ-GUARD>
      <DO-TALK-GUARD>)
    (<EQUAL? .OBJ ,OBJ-CORPSE>
      <TELL "The dead guard has nothing more to say." CR>)
    (T
      <TELL "There is no answer." CR>)>>

<ROUTINE OLD-MAN-CONVERSATION ("AUX" CH)
  <REPEAT ()
    <CRLF>
    <TELL "Ask the old man about:" CR>
    <TELL "  A. Himself" CR>
    <TELL "  B. The guard" CR>
    <TELL "  C. The deep places" CR>
    <TELL "  D. End conversation" CR>
    <TELL ">">
    <SET CH <READ-MENU-CHOICE>>
    <COND
      (<EQUAL? .CH 1>
        <TELL "The old man shows yellow teeth in a mirthless grin." CR>
        <TELL "\"I was a thief once, a lean wolf of the night. I crept beneath
this keep in search of gold, and found only chains, rats, and darkness.\"" CR>)
      (<EQUAL? .CH 2>
        <TELL "\"Find steel, if you would pass the guard,\" he rasps. \"Bare
hands win little against iron. He is proud of his helm and mail, but pride
bleeds.\"" CR>)
      (<EQUAL? .CH 3>
        <TELL "The old man lowers his voice." CR>
        <TELL "\"Below the old armory are drowned halls and a shrine older than
any king in this land. Black water guards it, and blacker dreams.\"" CR>)
      (<EQUAL? .CH 4>
        <TELL "The old man lowers his head again." CR>
        <RETURN>)
      (T
        <TELL "Choose A, B, C, or D." CR>)>>>

<ROUTINE GUARD-CONVERSATION ("AUX" CH)
  <REPEAT ()
    <CRLF>
    <TELL "Say to the guard:" CR>
    <TELL "  A. Who are you?" CR>
    <TELL "  B. Let me pass." CR>
    <TELL "  C. End conversation" CR>
    <TELL ">">
    <SET CH <READ-MENU-CHOICE>>
    <COND
      (<EQUAL? .CH 1>
        <TELL "The guard snorts." CR>
        <TELL "\"I am the last honest blade between this keep and rats like you.
Remember that while you still have teeth.\"" CR>)
      (<EQUAL? .CH 2>
        <SETG GUARD-ALERT T>
        <TELL "\"Pass?\" The guard lifts his sword. \"You pass when your bones
are dragged to the pit.\"" CR>)
      (<EQUAL? .CH 3>
        <TELL "You break off the talk. The guard watches you with cold eyes." CR>
        <RETURN>)
      (T
        <TELL "Choose A, B, or C." CR>)>>>

<ROUTINE DO-TALK-OLD-MAN ()
  <COND
    (<NOT <OLD-MAN-HERE?>>
      <TELL "The old man is not here." CR>)
    (,OLD-MAN-DEAD
      <TELL "The old man is dead." CR>)
    (T
      <COND
        (<NOT ,OLD-MAN-TALKED>
          <SETG OLD-MAN-TALKED T>
          <TELL "The old man lifts his head. His beard is white with dust and
his eyes gleam in the gloom." CR>)
        (T
          <TELL "The old man peers up from the rotten straw." CR>)>
      <OLD-MAN-CONVERSATION>)>>

<ROUTINE DO-TALK-GUARD ()
  <COND
    (,GUARD-DEAD
      <TELL "The guard is dead." CR>)
    (<NOT <GUARD-HERE?>>
      <TELL "The guard is not here." CR>)
    (T
      <SETG GUARD-ALERT T>
      <TELL "The guard bares his teeth and tightens his grip on the sword." CR>
      <GUARD-CONVERSATION>)>>

<ROUTINE DO-KILL-OLD-MAN ()
  <COND
    (<NOT <OLD-MAN-HERE?>>
      <TELL "The old man is not here." CR>)
    (,OLD-MAN-DEAD
      <TELL "The old man is already dead." CR>)
    (T
      <SETG OLD-MAN-DEAD T>
      <COND
        (<PLAYER-HAS-SWORD?>
          <TELL "You cut down the old man with your sword. He falls into the
rotten straw without a cry." CR>)
        (T
          <TELL "You seize the old man by the throat and strangle the life from
him. He slumps into the rotten straw." CR>)>)>>

"COMBAT HELPERS"
<ROUTINE ARMOR-DAMAGE (RAW ARMOR "AUX" D)
  <SET D <- .RAW .ARMOR>>
  <COND
    (<L? .D 1>
      <RETURN 0>)
    (T
      <RETURN .D>)>>

<ROUTINE HURT-GUARD (D)
  <SETG GUARD-HP <- ,GUARD-HP .D>>
  <COND
    (<L? ,GUARD-HP 1>
      <SETG GUARD-HP 0>
      <SETG GUARD-DEAD T>
      <SETG CORPSE-PLACE ,ROOM>
      <SETG GUARD-PLACE ,NOWHERE>
      <SETG GUARD-ALERT <>>
      <SETG GUARD-FOLLOWING <>>
      <TELL "The guard falls dead at your feet." CR>)
    (T
      <TELL "The guard has " N ,GUARD-HP " HP left." CR>)>>

<ROUTINE DEATH-RESTART ()
  <COND
    (<CONFIRM-YES? "Restart? (Y/YES) >">
      <TELL "Restarting." CR CR>
      <SOFT-RESTART>)
    (T
      <QUIT>)>
  <RTRUE>>

<ROUTINE HURT-PLAYER (D)
  <SETG HP <- ,HP .D>>
  <COND
    (<L? ,HP 1>
      <SETG HP 0>
      <TELL "You fall beneath the guard's blade." CR CR>
      <TELL "-- GAME OVER --" CR CR>
      <DEATH-RESTART>)
    (T
      <TELL "You have " N ,HP " HP left." CR>)>>

<ROUTINE TRAP-HURT (D)
  <COND
    (<L? ,HP <+ .D 1>>
      <SETG HP 1>
      <TELL "The shock nearly kills you. You have 1 HP left." CR>)
    (T
      <SETG HP <- ,HP .D>>
      <TELL "You have " N ,HP " HP left." CR>)>>

<ROUTINE PLAYER-HAS-SWORD? ()
  <COND
    (<OR <EQUAL? ,SWORD-PLACE ,INVENTORY> <EQUAL? ,GUARD-SWORD-PLACE ,INVENTORY>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE HALF-DAMAGE (N)
  <COND
    (<L? .N 2>
      <RETURN 0>)
    (<L? .N 4>
      <RETURN 1>)
    (<L? .N 6>
      <RETURN 2>)
    (T
      <RETURN 3>)>>

<ROUTINE PLAYER-DAMAGE-ROLL ("AUX" R)
  <SET R <ROLL-D6 "Roll 1d6 for your damage: ">>
  <COND
    (<PLAYER-HAS-SWORD?>
      <RETURN .R>)
    (T
      <RETURN <HALF-DAMAGE .R>>)>>

<ROUTINE FIGHT-GUARD-ROUND ("AUX" PR GR RAW DMG)
  <SETG GUARD-ALERT T>
  <TELL "You attack the guard." CR>
  <SET PR <+ <ROLL-D6 "Roll 1d6 for your attack: "> ,ATTR-W>>
  <SET GR <+ <ROLL-D6 "Roll 1d6 for the guard attack: "> ,GUARD-W>>
  <TELL "You roll " N .PR "; the guard rolls " N .GR "." CR>
  <COND
    (<G? .PR .GR>
      <SET RAW <PLAYER-DAMAGE-ROLL>>
      <SET DMG <ARMOR-DAMAGE .RAW ,GUARD-AP>>
      <COND
        (<PLAYER-HAS-SWORD?>
          <TELL "You strike with your sword for " N .RAW " damage. The guard's
AP " N ,GUARD-AP " reduces it to " N .DMG "." CR>)
        (T
          <TELL "You fight without a sword and hit for " N .RAW " damage. The
guard's AP " N ,GUARD-AP " reduces it to " N .DMG "." CR>)>
      <COND
        (<0? .DMG>
          <TELL "His helm and chainmail turn the blow." CR>)
        (T
          <HURT-GUARD .DMG>)>)
    (<G? .GR .PR>
      <SET RAW <ROLL-D6 "Roll 1d6 for the guard damage: ">>
      <SET DMG <ARMOR-DAMAGE .RAW ,AP>>
      <TELL "The guard hits for " N .RAW " damage. Your AP " N ,AP " reduces it
to " N .DMG "." CR>
      <COND
        (<0? .DMG>
          <TELL "Your armor turns the blow." CR>)
        (T
          <HURT-PLAYER .DMG>)>)
    (T
      <TELL "Steel rings on steel, but neither fighter gains the advantage." CR>)>>

"OBJECT DATABASE"
<ROUTINE OBJ-PLACE (OBJ)
  <COND
    (<EQUAL? .OBJ ,OBJ-LAMP>
      <RETURN ,LAMP-PLACE>)
    (<EQUAL? .OBJ ,OBJ-KEY>
      <RETURN ,KEY-PLACE>)
    (<EQUAL? .OBJ ,OBJ-FLASK>
      <RETURN ,FLASK-PLACE>)
    (<EQUAL? .OBJ ,OBJ-BACKPACK>
      <RETURN ,BACKPACK-PLACE>)
    (<EQUAL? .OBJ ,OBJ-CORPSE>
      <RETURN ,CORPSE-PLACE>)
    (<EQUAL? .OBJ ,OBJ-HELMET>
      <RETURN ,HELMET-PLACE>)
    (<EQUAL? .OBJ ,OBJ-CHAINMAIL>
      <RETURN ,CHAINMAIL-PLACE>)
    (<EQUAL? .OBJ ,OBJ-SWORD>
      <RETURN ,SWORD-PLACE>)
    (<EQUAL? .OBJ ,OBJ-GUARD-SWORD>
      <RETURN ,GUARD-SWORD-PLACE>)
    (<EQUAL? .OBJ ,OBJ-RING>
      <RETURN ,RING-PLACE>)
    (<EQUAL? .OBJ ,OBJ-GEM>
      <RETURN ,GEM-PLACE>)
    (<EQUAL? .OBJ ,OBJ-BONE>
      <RETURN ,BONE-PLACE>)
    (<EQUAL? .OBJ ,OBJ-CHISEL>
      <RETURN ,CHISEL-PLACE>)
    (T
      <RETURN ,NOWHERE>)>>

<ROUTINE SET-OBJ-PLACE (OBJ LOC)
  <COND
    (<EQUAL? .OBJ ,OBJ-LAMP>
      <SETG LAMP-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-KEY>
      <SETG KEY-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-FLASK>
      <SETG FLASK-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-BACKPACK>
      <SETG BACKPACK-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-HELMET>
      <SETG HELMET-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-CHAINMAIL>
      <SETG CHAINMAIL-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-SWORD>
      <SETG SWORD-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-GUARD-SWORD>
      <SETG GUARD-SWORD-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-RING>
      <SETG RING-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-GEM>
      <SETG GEM-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-BONE>
      <SETG BONE-PLACE .LOC>)
    (<EQUAL? .OBJ ,OBJ-CHISEL>
      <SETG CHISEL-PLACE .LOC>)>>

<ROUTINE PORTABLE? (OBJ)
  <COND
    (<OR
      <EQUAL? .OBJ ,OBJ-LAMP>
      <EQUAL? .OBJ ,OBJ-KEY>
      <EQUAL? .OBJ ,OBJ-FLASK>
      <EQUAL? .OBJ ,OBJ-BACKPACK>
      <EQUAL? .OBJ ,OBJ-HELMET>
      <EQUAL? .OBJ ,OBJ-CHAINMAIL>
      <EQUAL? .OBJ ,OBJ-SWORD>
      <EQUAL? .OBJ ,OBJ-GUARD-SWORD>
      <EQUAL? .OBJ ,OBJ-GEM>
      <EQUAL? .OBJ ,OBJ-BONE>
      <EQUAL? .OBJ ,OBJ-CHISEL>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE OBJ-VISIBLE? (OBJ)
  <COND
    (<AND
      <DARK-ROOM?>
      <NOT <EQUAL? .OBJ ,OBJ-LAMP>>
      <NOT <EQUAL? .OBJ ,OBJ-ROOM>>
      <NOT <EQUAL? .OBJ ,OBJ-SELF>>>
      <RFALSE>)
    (<EQUAL? .OBJ ,OBJ-LAMP>
      <COND
        (<OR
          <EQUAL? ,LAMP-PLACE ,ROOM>
          <EQUAL? ,LAMP-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-KEY>
      <COND
        (<OR
          <EQUAL? ,KEY-PLACE ,INVENTORY>
          <AND <EQUAL? ,KEY-PLACE ,ROOM> <NOT <DARK-ROOM?>>>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-FLASK>
      <COND
        (<OR
          <EQUAL? ,FLASK-PLACE ,INVENTORY>
          <AND <EQUAL? ,FLASK-PLACE ,ROOM> <NOT <DARK-ROOM?>>>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-BACKPACK>
      <COND
        (<OR
          <EQUAL? ,BACKPACK-PLACE ,INVENTORY>
          <AND <EQUAL? ,BACKPACK-PLACE ,ROOM> <NOT <DARK-ROOM?>>>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-CORPSE>
      <COND
        (<CORPSE-HERE?>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-HELMET>
      <COND
        (<OR <EQUAL? ,HELMET-PLACE ,ROOM> <EQUAL? ,HELMET-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-CHAINMAIL>
      <COND
        (<OR <EQUAL? ,CHAINMAIL-PLACE ,ROOM> <EQUAL? ,CHAINMAIL-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-SWORD>
      <COND
        (<OR <EQUAL? ,SWORD-PLACE ,ROOM> <EQUAL? ,SWORD-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-GUARD-SWORD>
      <COND
        (<OR <EQUAL? ,GUARD-SWORD-PLACE ,ROOM> <EQUAL? ,GUARD-SWORD-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-RING>
      <COND
        (<EQUAL? ,RING-PLACE ,ROOM>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-LEVER>
      <LEVER-HERE?>)
    (<EQUAL? .OBJ ,OBJ-GEM>
      <COND
        (<OR <EQUAL? ,GEM-PLACE ,ROOM> <EQUAL? ,GEM-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-BONE>
      <COND
        (<OR <EQUAL? ,BONE-PLACE ,ROOM> <EQUAL? ,BONE-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-CHISEL>
      <COND
        (<OR <EQUAL? ,CHISEL-PLACE ,ROOM> <EQUAL? ,CHISEL-PLACE ,INVENTORY>>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-CHAINS>
      <COND
        (<EQUAL? ,ROOM ,RM-CELL>
          <RTRUE>)
        (T
          <RFALSE>)>)
    (<EQUAL? .OBJ ,OBJ-STONE-DOOR>
      <STONE-DOOR-HERE?>)
    (<EQUAL? .OBJ ,OBJ-CELL-DOOR>
      <CELL-DOOR-HERE?>)
    (<EQUAL? .OBJ ,OBJ-GATE>
      <GATE-HERE?>)
    (<EQUAL? .OBJ ,OBJ-GUARD>
      <GUARD-HERE?>)
    (<EQUAL? .OBJ ,OBJ-OLD-MAN>
      <OLD-MAN-HERE?>)
    (<EQUAL? .OBJ ,OBJ-ROOM>
      <RTRUE>)
    (<EQUAL? .OBJ ,OBJ-SELF>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE OBJ-ACCESSIBLE? (OBJ)
  <COND
    (<OBJ-VISIBLE? .OBJ>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE PRINT-OBJ-LINE (OBJ)
  <COND
    (<EQUAL? .OBJ ,OBJ-LAMP>
      <TELL "A brass lamp lies here">
      <COND (,LAMP-LIT <TELL ", giving off a weak yellow light">)>
      <TELL "." CR>)
    (<EQUAL? .OBJ ,OBJ-KEY>
      <TELL "A rusty key is half-hidden among the stones." CR>)
    (<EQUAL? .OBJ ,OBJ-FLASK>
      <COND
        (<EQUAL? ,ROOM ,RM-ARMORY>
          <TELL "A flask of water stands on a cracked shelf." CR>)
        (T
          <TELL "A flask of water lies here." CR>)>)
    (<EQUAL? .OBJ ,OBJ-BACKPACK>
      <TELL "An old backpack lies folded among the dust and rust." CR>)
    (<EQUAL? .OBJ ,OBJ-CORPSE>
      <TELL "The dead body of the guard lies here." CR>)
    (<EQUAL? .OBJ ,OBJ-HELMET>
      <TELL "A dented iron helmet lies here." CR>)
    (<EQUAL? .OBJ ,OBJ-CHAINMAIL>
      <TELL "A shirt of dark chainmail lies here." CR>)
    (<EQUAL? .OBJ ,OBJ-SWORD>
      <COND
        (<AND <EQUAL? ,ROOM ,RM-ARMORY> <NOT ,OLD-SWORD-TAKEN>>
          <TELL "A plain sword rests on a splintered rack." CR>)
        (T
          <TELL "An old sword lies here." CR>)>)
    (<EQUAL? .OBJ ,OBJ-GUARD-SWORD>
      <TELL "The guard's sword lies here." CR>)
    (<EQUAL? .OBJ ,OBJ-RING>
      <TELL "An iron ring, black as old blood, juts from the wall." CR>)
    (<EQUAL? .OBJ ,OBJ-GEM>
      <COND
        (,GEM-LOOSENED
          <TELL "A black gem lies loose, cold as a dead star." CR>)
        (T
          <TELL "A black gem burns with cold star-fire on the altar." CR>)>)
    (<EQUAL? .OBJ ,OBJ-BONE>
      <COND
        (<EQUAL? ,ROOM ,RM-CELL>
          <TELL "A jagged bone lies among the rotten straw." CR>)
        (T
          <TELL "A jagged bone lies here." CR>)>)
    (<EQUAL? .OBJ ,OBJ-CHISEL>
      <TELL "A green bronze chisel lies here, narrow as a serpent's fang." CR>)>>

<ROUTINE DESCRIBE-OBJECTS-HERE ()
  <COND
    (<AND <EQUAL? ,LAMP-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-LAMP>>
      <PRINT-OBJ-LINE ,OBJ-LAMP>)>
  <COND
    (<AND <EQUAL? ,KEY-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-KEY>>
      <PRINT-OBJ-LINE ,OBJ-KEY>)>
  <COND
    (<AND <EQUAL? ,FLASK-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-FLASK>>
      <PRINT-OBJ-LINE ,OBJ-FLASK>)>
  <COND
    (<AND <EQUAL? ,BACKPACK-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-BACKPACK>>
      <PRINT-OBJ-LINE ,OBJ-BACKPACK>)>
  <COND
    (<AND <EQUAL? ,BONE-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-BONE>>
      <PRINT-OBJ-LINE ,OBJ-BONE>)>
  <COND
    (<AND <EQUAL? ,CHISEL-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-CHISEL>>
      <PRINT-OBJ-LINE ,OBJ-CHISEL>)>
  <COND
    (<AND <EQUAL? ,CORPSE-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-CORPSE>>
      <PRINT-OBJ-LINE ,OBJ-CORPSE>)>
  <COND
    (<AND <EQUAL? ,HELMET-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-HELMET>>
      <PRINT-OBJ-LINE ,OBJ-HELMET>)>
  <COND
    (<AND <EQUAL? ,CHAINMAIL-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-CHAINMAIL>>
      <PRINT-OBJ-LINE ,OBJ-CHAINMAIL>)>
  <COND
    (<AND <EQUAL? ,SWORD-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-SWORD>>
      <PRINT-OBJ-LINE ,OBJ-SWORD>)>
  <COND
    (<AND <EQUAL? ,GUARD-SWORD-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-GUARD-SWORD>>
      <PRINT-OBJ-LINE ,OBJ-GUARD-SWORD>)>
  <COND
    (<AND <EQUAL? ,RING-PLACE ,ROOM> <OBJ-VISIBLE? ,OBJ-RING>>
      <PRINT-OBJ-LINE ,OBJ-RING>)>
  <COND
    (<AND
      <EQUAL? ,GEM-PLACE ,ROOM>
      <OBJ-VISIBLE? ,OBJ-GEM>
      <NOT <EQUAL? ,ROOM ,RM-SHRINE>>>
      <PRINT-OBJ-LINE ,OBJ-GEM>)>
  <COND
    (<LEVER-HERE?>
      <TELL "A rusted lever juts from the wall like the hilt of a buried sword." CR>)>
  <NOTICE-OLD-MAN>>

"ROOM DESCRIPTIONS"
<ROUTINE DESCRIBE-ROOM ()
  <CRLF>
  <ROOM-NAME>
  <TELL CR>
  <TELL "--------------------------------" CR>

  <COND
    (<DARK-ROOM?>
      <COND
        (<EQUAL? ,ROOM ,RM-ALCOVE>
          <TELL
"It is pitch black here. You can make out only the faint rectangle of the
exit to the south." CR>)
        (T
          <TELL
"Blackness presses against your eyes like a burial cloth. In these lower
vaults a man without a lamp is less than blind." CR>)>)

    (<EQUAL? ,ROOM ,RM-CELL>
      <TELL
"You are in a damp stone cell beneath an old keep. Rotten straw covers the
floor. A heavy door stands in the northern opening." CR>
      <COND
        (,PLAYER-CHAINED
          <TELL "Iron chains bite your wrists and hold you to the wall." CR>)
        (T
          <TELL "Broken chains hang from the wall like dead iron snakes." CR>)>
      <COND
        (,CELL-DOOR-OPEN
          <TELL "The cell door is open." CR>)
        (T
          <TELL "The cell door is closed." CR>)>)

    (<EQUAL? ,ROOM ,RM-HALL>
      <TELL
"You are in a low dungeon hall. Water drips from the ceiling and runs between
the flagstones.  The cell lies south, an old armory lies west, and a corridor
leads east." CR>
      <COND
        (,CELL-DOOR-OPEN
          <TELL "The cell door to the south stands open." CR>)
        (T
          <TELL "The cell door to the south is closed." CR>)>)

    (<EQUAL? ,ROOM ,RM-ARMORY>
      <TELL
"This was once an armory, but only rust stains and splintered racks remain.
The dungeon hall is east. A warped hatch lies north, swollen shut." CR>)

    (<EQUAL? ,ROOM ,RM-NICHE>
      <TELL
"You crouch in a slit of stone behind the armory wall. The dust is old as
forgotten kings, and the shelves sag like dead men's ribs. Deep claw-marks
score the blocks. The armory is south." CR>
      <COND
        (,STONE-DOOR-OPEN
          <TELL "The stone slab gapes open upon a black passage east." CR>)
        (T
          <TELL "A close-set stone slab seals a narrow cleft to the east." CR>)>)

    (<EQUAL? ,ROOM ,RM-VAULT>
      <TELL
"You stand in a sunken vault where broken urns lie in drifts of black dust.
The lamp paints red-gold scales on the walls, and the air tastes of age, iron,
and dead kings. The hidden niche is west. A damp stair drops through a square
throat in the floor." CR>)

    (<EQUAL? ,ROOM ,RM-SERPENT-STAIR>
      <TELL
"The stair coils downward like the spine of some petrified serpent. Each step
is narrow, wet, and worn hollow by feet that passed here before the keep was
raised. The vault is up; deeper darkness waits below." CR>)

    (<EQUAL? ,ROOM ,RM-SPEAR-HALL>
      <TELL
"You stand in a long hall whose walls are pierced with black murder-holes.
Rusted spearheads jut from some of them like broken fangs. The serpent stair
climbs up, and the hall runs east beneath a low arch." CR>
      <COND
        (,SPEAR-TRAP-SEEN
          <TELL "You have marked the old spear slots and know where not to set
your feet." CR>)>)

    (<EQUAL? ,ROOM ,RM-PIT-BRIDGE>
      <TELL
"A narrow bridge of cracked stone crosses a pit filled with skulls and white
rubble. Far below, unseen water mutters. The spear hall lies west; a bone-hung
chamber waits east." CR>
      <COND
        (,PIT-TRAP-SEEN
          <TELL "A broken flagstone near the middle shows where the bridge is
treacherous." CR>)>)

    (<EQUAL? ,ROOM ,RM-BONE-CHAMBER>
      <TELL
"Bones are mortared into the walls of this chamber: men, apes, and things not
wholly either. Empty skulls grin from niches. The bridge is west, and worn
steps descend toward the smell of black water." CR>
      <COND
        (,DART-TRAP-SEEN
          <TELL "You have seen the tiny mouths in the skulls where poisoned
darts once slept." CR>)>)

    (<EQUAL? ,ROOM ,RM-CISTERN>
      <COND
        (,CISTERN-DRAINED
          <TELL
"You stand on the slime-slick floor of the Well of Black Waters. The drowned
stone reeks like a serpent's belly, and a low arch yawns east. The bone chamber
waits above." CR>)
        (T
          <TELL
"You stand on a narrow ledge above the Well of Black Waters. The pool below is
black and lightless, yet it stirs under the lamp-glow as if some drowned god
breathed beneath it. A low eastern arch is swallowed by the water; steps climb
back up." CR>)>)

    (<EQUAL? ,ROOM ,RM-SHRINE>
      <TELL
"You are in a shrine older than the keep and fouler than any tomb of men. A
cracked altar squats under roots that hang like dead snakes. The Well of Black
Waters is west." CR>
      <COND
        (<EQUAL? ,GEM-PLACE ,INVENTORY>
          <TELL "The altar's stone claws are empty now." CR>)
        (,GEM-LOOSENED
          <TELL "The black gem lies loose on the altar, its witch-light still
burning." CR>)
        (T
          <TELL "A black gem is clenched in the altar's stone claws, burning
with witch-light." CR>)>)

    (<EQUAL? ,ROOM ,RM-CORRIDOR>
      <TELL
"You are in a narrow east-west corridor. A dark alcove opens to the north. An
iron gate blocks the way east." CR>
      <COND
        (,GATE-OPEN
          <TELL "The iron gate stands open." CR>)
        (,GATE-UNLOCKED
          <TELL "The iron gate is unlocked but still closed." CR>)
        (T
          <TELL "The iron gate is shut and locked." CR>)>)

    (<EQUAL? ,ROOM ,RM-ALCOVE>
      <TELL
"This cramped alcove smells of cold ashes. The light from your lamp shows deep
scratches in the stone floor. The only exit is south." CR>)

    (<EQUAL? ,ROOM ,RM-GUARDROOM>
      <TELL
"You are in a ruined guard room beyond the iron gate. Broken benches line the
walls. A cracked stairway leads up, and the corridor lies west." CR>)

    (<EQUAL? ,ROOM ,RM-COURTYARD>
      <TELL
"You stand in a moonlit courtyard. Beyond the broken wall lies the forest and
freedom." CR>)

    (T
      <TELL "There is nothing to see." CR>)>

  <COND
    (<NOT <DARK-ROOM?>>
      <DESCRIBE-OBJECTS-HERE>)>

  <NOTICE-GUARD>

  <COND
    (<EQUAL? ,ROOM ,RM-COURTYARD>
      <TELL CR "You have escaped the dungeon in " N ,TURNS " move">
      <COND
        (<NOT <EQUAL? ,TURNS 1>>
          <TELL "s">)>
      <TELL "." CR>
      <SETG GAME-OVER T>)>>

<ROUTINE DO-LOOK ()
  <DESCRIBE-ROOM>>

<ROUTINE AFTER-MOVE ()
  <MOVE-GUARD-AFTER-PLAYER-MOVE>>

<ROUTINE DARK-RETREAT? (FROM DIR)
  <COND
    (<AND <EQUAL? .FROM ,RM-VAULT> <EQUAL? .DIR ,P?WEST>> <RTRUE>)
    (<AND <EQUAL? .FROM ,RM-SERPENT-STAIR> <EQUAL? .DIR ,P?UP>> <RTRUE>)
    (<AND <EQUAL? .FROM ,RM-SPEAR-HALL> <EQUAL? .DIR ,P?UP>> <RTRUE>)
    (<AND <EQUAL? .FROM ,RM-PIT-BRIDGE> <EQUAL? .DIR ,P?WEST>> <RTRUE>)
    (<AND <EQUAL? .FROM ,RM-BONE-CHAMBER> <EQUAL? .DIR ,P?WEST>> <RTRUE>)
    (<AND <EQUAL? .FROM ,RM-CISTERN> <EQUAL? .DIR ,P?UP>> <RTRUE>)
    (<AND <EQUAL? .FROM ,RM-SHRINE> <EQUAL? .DIR ,P?WEST>> <RTRUE>)
    (T <RFALSE>)>>

<ROUTINE LOWER-VAULT? (FROM)
  <COND
    (<OR
      <EQUAL? .FROM ,RM-VAULT>
      <EQUAL? .FROM ,RM-SERPENT-STAIR>
      <EQUAL? .FROM ,RM-SPEAR-HALL>
      <EQUAL? .FROM ,RM-PIT-BRIDGE>
      <EQUAL? .FROM ,RM-BONE-CHAMBER>
      <EQUAL? .FROM ,RM-CISTERN>
      <EQUAL? .FROM ,RM-SHRINE>>
      <RTRUE>)
    (T <RFALSE>)>>

<ROUTINE UNLIT-LOWER-VAULT? (FROM)
  <COND
    (<AND <LOWER-VAULT? .FROM> <NOT <LIGHT-HERE?>>>
      <RTRUE>)
    (T <RFALSE>)>>
<ROUTINE BEFORE-TURN (VERB)
  <SETG GUARD-THREATENING <>>
  <COND
    (<GUARD-HERE?>
      <SETG GUARD-THREATENING T>)>>

<ROUTINE AFTER-TURN (VERB)
  <COND
    (<OR ,GAME-OVER <NOT ,GUARD-THREATENING> <NOT <GUARD-HERE?>> ,GUARD-DEAD>
      <RTRUE>)
    (<OR
      <WORD-TO-DIR .VERB>
      <EQUAL? .VERB ,W?GO>
      <EQUAL? .VERB ,W?WALK>>
      <RTRUE>)
    (<AND
      <OR <EQUAL? .VERB ,W?KILL> <EQUAL? .VERB ,W?K>>
      <EQUAL? ,LAST-OBJECT ,OBJ-GUARD>>
      <RTRUE>)
    (T
      <TELL "The guard gives you no time to waste. He strikes you for 2 damage." CR>
      <HURT-PLAYER 2>)>>


<ROUTINE EXIT-BLOCKED? (FROM DIR)
  <COND
    (<AND
      <EQUAL? .FROM ,RM-NICHE>
      <EQUAL? .DIR ,P?EAST>
      <NOT <LIGHT-HERE?>>>
      <TELL "The cleft beyond is black as a Stygian tomb. You will need a lit lamp before descending." CR>
      <RTRUE>)
    (<AND
      <UNLIT-LOWER-VAULT? .FROM>
      <NOT <DARK-RETREAT? .FROM .DIR>>>
      <TELL "You grope into blind blackness, then draw back. Without the lamp
you would break your neck below." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-SPEAR-HALL>
      <EQUAL? .DIR ,P?EAST>
      <NOT ,SPEAR-TRAP-SEEN>
      <NOT ,SPEAR-TRAP-SPRUNG>>
      <SETG SPEAR-TRAP-SPRUNG T>
      <TELL "As you stride beneath the arch, a hidden spear snaps from the wall
and tears your side for 1 damage." CR>
      <TRAP-HURT 1>
      <RFALSE>)
    (<AND
      <EQUAL? .FROM ,RM-PIT-BRIDGE>
      <EQUAL? .DIR ,P?EAST>
      <NOT ,PIT-TRAP-SEEN>
      <NOT ,PIT-TRAP-SPRUNG>>
      <SETG PIT-TRAP-SPRUNG T>
      <TELL "A flagstone drops under your heel. You lurch from the pit's lip as
skulls clatter far below. The fall costs you 1 damage." CR>
      <TRAP-HURT 1>
      <RFALSE>)
    (<AND
      <EQUAL? .FROM ,RM-BONE-CHAMBER>
      <EQUAL? .DIR ,P?DOWN>
      <NOT ,DART-TRAP-SEEN>
      <NOT ,DART-TRAP-SPRUNG>>
      <SETG DART-TRAP-SPRUNG T>
      <TELL "A dry click sounds in the skulls. A stone dart grazes your neck for
1 damage before you fling yourself down the steps." CR>
      <TRAP-HURT 1>
      <RFALSE>)
    (<AND
      <EQUAL? .FROM ,RM-CELL>
      <EQUAL? .DIR ,P?NORTH>
      ,PLAYER-CHAINED>
      <TELL "The chains jerk you back before you can leave the cell." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-CELL>
      <EQUAL? .DIR ,P?NORTH>
      <NOT ,CELL-DOOR-OPEN>>
      <TELL "The cell door is closed." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-HALL>
      <EQUAL? .DIR ,P?SOUTH>
      <NOT ,CELL-DOOR-OPEN>>
      <TELL "The cell door is closed." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-NICHE>
      <EQUAL? .DIR ,P?EAST>
      <NOT ,STONE-DOOR-OPEN>>
      <TELL "The stone slab bars the eastern cleft." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-VAULT>
      <EQUAL? .DIR ,P?WEST>
      <NOT ,STONE-DOOR-OPEN>>
      <TELL "The stone slab bars the way west." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-CISTERN>
      <EQUAL? .DIR ,P?EAST>
      <NOT ,CISTERN-DRAINED>>
      <TELL "Black water drowns the eastern arch. No sane man could pass while
the Well of Black Waters is full." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-CORRIDOR>
      <EQUAL? .DIR ,P?EAST>
      <NOT ,GATE-OPEN>>
      <COND
        (,GATE-UNLOCKED
          <TELL "The iron gate is closed." CR>)
        (T
          <TELL "The iron gate is locked." CR>)>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-GUARDROOM>
      <EQUAL? .DIR ,P?WEST>
      <NOT ,GATE-OPEN>>
      <TELL "The iron gate is closed." CR>
      <RTRUE>)
    (<AND
      <EQUAL? .FROM ,RM-ARMORY>
      <EQUAL? .DIR ,P?NORTH>
      <NOT <PLAYER-HAS-SWORD?>>>
      <TELL "The warped hatch will not move by hand. You need a blade to pry it
open." CR>
      <RTRUE>)
    (T
      <RFALSE>)>>

"ACTIONS"
<ROUTINE CARRIED-COUNT ("AUX" N)
  <SET N 0>
  <COND (<EQUAL? ,LAMP-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,KEY-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,FLASK-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,BACKPACK-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,BONE-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,CHISEL-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,SWORD-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,GUARD-SWORD-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <COND (<EQUAL? ,GEM-PLACE ,INVENTORY> <SET N <+ .N 1>>)> 
  <RETURN .N>>

<ROUTINE CARRY-LIMIT ()
  <COND
    (<EQUAL? ,BACKPACK-PLACE ,INVENTORY>
      <RETURN 10>)
    (T
      <RETURN 2>)>>

<ROUTINE CARRY-FULL? ()
  <COND
    (<NOT <L? <CARRIED-COUNT> <CARRY-LIMIT>>>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE DO-INVENTORY ("AUX" ANY)
  <SET ANY <>>
  <TELL "You are carrying:" CR>
  <COND
    (<EQUAL? ,LAMP-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  brass lamp">
      <COND (,LAMP-LIT <TELL " (providing light)">)>
      <TELL CR>)>
  <COND
    (<EQUAL? ,KEY-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  rusty key" CR>)>
  <COND
    (<EQUAL? ,FLASK-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  flask of water" CR>)>
  <COND
    (<EQUAL? ,BACKPACK-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  leather backpack" CR>)>
  <COND
    (<EQUAL? ,BONE-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  jagged bone" CR>)>
  <COND
    (<EQUAL? ,CHISEL-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  green bronze chisel" CR>)>
  <COND
    (<EQUAL? ,HELMET-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  dented iron helmet (AP +1)" CR>)>
  <COND
    (<EQUAL? ,CHAINMAIL-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  shirt of dark chainmail (AP +2)" CR>)>
  <COND
    (<EQUAL? ,SWORD-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  old sword (1d6)" CR>)>
  <COND
    (<EQUAL? ,GUARD-SWORD-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  guard's sword (1d6)" CR>)>
  <COND
    (<EQUAL? ,GEM-PLACE ,INVENTORY>
      <SET ANY T>
      <TELL "  black gem" CR>)>
  <COND
    (<NOT .ANY>
      <TELL "  nothing" CR>)>>

<ROUTINE DO-EXAMINE (OBJ)
  <COND
    (<NOT <OBJ-ACCESSIBLE? .OBJ>>
      <TELL "You see no such thing here." CR>)

    (<EQUAL? .OBJ ,OBJ-LAMP>
      <TELL "It is a battered brass lamp, blackened with age">
      <COND
        (,LAMP-LIT <TELL ". It is lit." CR>)
        (T <TELL ". It is not lit." CR>)>)

    (<EQUAL? .OBJ ,OBJ-KEY>
      <TELL "The rusty key is crude but heavy enough for an old lock." CR>)

    (<EQUAL? .OBJ ,OBJ-FLASK>
      <TELL "It is a small stoppered flask, filled with stale but drinkable water." CR>)

    (<EQUAL? .OBJ ,OBJ-BACKPACK>
      <TELL "The leather backpack is patched, stiff with age, and still
serviceable. With it, you can carry eight extra items." CR>)

    (<EQUAL? .OBJ ,OBJ-BONE>
      <TELL "The bone is splintered to a cruel point. It might serve as a poor
little pick." CR>)

    (<EQUAL? .OBJ ,OBJ-CHISEL>
      <TELL "The chisel is green bronze, old and narrow, made for fine
stonework. Its edge is still cruelly keen." CR>)

    (<EQUAL? .OBJ ,OBJ-CHAINS>
      <COND
        (,PLAYER-CHAINED
          <TELL "The wrist-irons are fastened by a rust-eaten pin. It is too
narrow for your fingers, but something sharp might worry it loose." CR>)
        (T
          <TELL "The chains hang broken from the wall. Their rusted pin lies
bent in the straw." CR>)>)

    (<EQUAL? .OBJ ,OBJ-CELL-DOOR>
      <COND
        (,CELL-DOOR-OPEN
          <TELL "The heavy cell door stands open on groaning hinges." CR>)
        (T
          <TELL "The heavy cell door is swollen with damp. It is closed, but
not locked." CR>)>)

    (<EQUAL? .OBJ ,OBJ-GATE>
      <COND
        (,GATE-OPEN
          <TELL "The iron gate stands open." CR>)
        (,GATE-UNLOCKED
          <TELL "The iron gate is unlocked but closed." CR>)
        (T
          <TELL "The iron gate is locked. Its lock is old but substantial." CR>)>)

    (<EQUAL? .OBJ ,OBJ-STONE-DOOR>
      <COND
        (,STONE-DOOR-OPEN
          <TELL "The stone slab has swung aside, revealing a black cleft beyond." CR>)
        (T
          <TELL "The slab is fitted with the craft of dead masons. No handhold
mars its face." CR>)>)

    (<EQUAL? .OBJ ,OBJ-RING>
      <TELL "An iron ring, black with age, is sunk into the stone. It has the
look of old sorcery and death." CR>)

    (<EQUAL? .OBJ ,OBJ-LEVER>
      <COND
        (,CISTERN-DRAINED
          <TELL "The lever is down. Far below, the last black water still
mutters in hidden drains." CR>)
        (T
          <TELL "The rusted lever is stiff, but there is iron life in it yet." CR>)>)

    (<EQUAL? .OBJ ,OBJ-GEM>
      <COND
        (,GEM-LOOSENED
          <TELL "The black gem lies loose now. A star-like fire glimmers far
down in its cold heart." CR>)
        (T
          <TELL "The black gem is cold and smooth, but stone claws bind it to
the altar. No bare hand will tear it free." CR>)>)

    (<EQUAL? .OBJ ,OBJ-ROOM>
      <DESCRIBE-ROOM>)

    (<EQUAL? .OBJ ,OBJ-GUARD>
      <TELL "The guard is a hard-bitten watchman of the dungeon, broad under a
dented iron helm and a shirt of dark chainmail. A naked sword hangs in his fist,
 and his eyes have the cold shine of a wolf in torchlight." CR>)

    (<EQUAL? .OBJ ,OBJ-OLD-MAN>
      <COND
        (,OLD-MAN-DEAD
          <TELL "The old man lies dead among the rotten straw." CR>)
        (T
          <TELL "He is gaunt and white-bearded, wrapped in rags, with eyes that
have seen too many black years under stone." CR>)>)

    (<EQUAL? .OBJ ,OBJ-CORPSE>
      <TELL "The guard lies sprawled in a dark heap, his iron helm askew and his
 chainmail hacked and bloodied. His sword is still near his hand." CR>
      <REVEAL-GUARD-LOOT>)

    (<EQUAL? .OBJ ,OBJ-HELMET>
      <TELL "A dented iron helmet, heavy enough to turn a glancing cut. It gives AP 1." CR>)

    (<EQUAL? .OBJ ,OBJ-CHAINMAIL>
      <TELL "A dark shirt of chainmail, rough and cold, but strong against steel. It gives AP 2." CR>)

    (<EQUAL? .OBJ ,OBJ-SWORD>
      <TELL "An old sword from the armory, plain but sound." CR>)

    (<EQUAL? .OBJ ,OBJ-GUARD-SWORD>
      <TELL "The guard's sword is nicked, plain, and serviceable." CR>)

    (<EQUAL? .OBJ ,OBJ-SELF>
      <TELL "You are a grim prisoner in this miserable place." CR>)

    (T
      <TELL "You see nothing special." CR>)>>

<ROUTINE TAKE-ALL-ONE (OBJ)
  <COND
    (<AND <PORTABLE? .OBJ> <EQUAL? <OBJ-PLACE .OBJ> ,ROOM> <OBJ-VISIBLE? .OBJ>>
      <DO-TAKE .OBJ>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE DO-TAKE-ALL ("AUX" ANY)
  <SET ANY <>>
  <COND
    (<AND <CORPSE-HERE?> <NOT ,GUARD-LOOT-REVEALED>>
      <REVEAL-GUARD-LOOT>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-BACKPACK>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-LAMP>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-KEY>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-FLASK>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-BONE>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-CHISEL>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-HELMET>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-CHAINMAIL>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-SWORD>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-GUARD-SWORD>
      <SET ANY T>)>
  <COND
    (<TAKE-ALL-ONE ,OBJ-GEM>
      <SET ANY T>)>
  <COND
    (<NOT .ANY>
      <TELL "There is nothing here to take." CR>)>>

<ROUTINE DO-TAKE (OBJ)
  <COND
    (<NOT <PORTABLE? .OBJ>>
      <TELL "You cannot take that." CR>)

    (<EQUAL? <OBJ-PLACE .OBJ> ,INVENTORY>
      <TELL "You already have it." CR>)

    (<NOT <OBJ-VISIBLE? .OBJ>>
      <TELL "You see no such thing here." CR>)

    (<NOT <EQUAL? <OBJ-PLACE .OBJ> ,ROOM>>
      <TELL "You cannot reach it from here." CR>)

    (<AND <OR <EQUAL? .OBJ ,OBJ-SWORD> <EQUAL? .OBJ ,OBJ-GUARD-SWORD>>
          <PLAYER-HAS-SWORD?>>
      <TELL "You are already carrying a sword." CR>)

    (<AND <EQUAL? .OBJ ,OBJ-GEM> <NOT ,GEM-LOOSENED>>
      <TELL "The black gem is clenched in stone claws. You cannot tear it free
with bare hands." CR>)

    (<AND
      <CARRY-FULL?>
      <NOT <EQUAL? .OBJ ,OBJ-HELMET>>
      <NOT <EQUAL? .OBJ ,OBJ-CHAINMAIL>>>
      <COND
        (<EQUAL? ,BACKPACK-PLACE ,INVENTORY>
          <TELL "Your hands and backpack are full." CR>)
        (T
          <TELL "Your hands are full. You need a backpack to carry more." CR>)>)

    (T
      <SET-OBJ-PLACE .OBJ ,INVENTORY>
      <COND
        (<EQUAL? .OBJ ,OBJ-HELMET>
          <SETG AP <+ ,AP 1>>
          <TELL "Taken. You put on the dented iron helmet. Your AP is now " N ,AP "." CR>)
        (<EQUAL? .OBJ ,OBJ-CHAINMAIL>
          <SETG AP <+ ,AP 2>>
          <TELL "Taken. You pull on the dark chainmail. Your AP is now " N ,AP "." CR>)
        (<EQUAL? .OBJ ,OBJ-SWORD>
          <SETG OLD-SWORD-TAKEN T>
          <TELL "Taken. You grip the old sword. Your blows now do 1d6 damage." CR>)
        (<EQUAL? .OBJ ,OBJ-GUARD-SWORD>
          <TELL "Taken. The guard's sword is now in your hand. Your blows now do
 1d6 damage." CR>)
        (<EQUAL? .OBJ ,OBJ-GEM>
          <TELL "Taken. The black gem flashes like a trapped star in your fist." CR>)
        (<EQUAL? .OBJ ,OBJ-BONE>
          <TELL "Taken. The jagged bone feels mean and useful in your hand." CR>)
        (<EQUAL? .OBJ ,OBJ-FLASK>
          <TELL "Taken. Cool water sloshes within the flask." CR>)
        (<EQUAL? .OBJ ,OBJ-BACKPACK>
          <TELL "Taken. You sling the old backpack over your shoulder." CR>)
        (<EQUAL? .OBJ ,OBJ-CHISEL>
          <TELL "Taken. The green bronze chisel is cold and sharp in your grip." CR>)
        (T
          <TELL "Taken." CR>)>)>>

<ROUTINE DROP-ALL-ONE (OBJ)
  <COND
    (<EQUAL? <OBJ-PLACE .OBJ> ,INVENTORY>
      <DO-DROP .OBJ>
      <RTRUE>)
    (T
      <RFALSE>)>>

<ROUTINE DO-DROP-ALL ("AUX" ANY)
  <SET ANY <>>
  <COND (<DROP-ALL-ONE ,OBJ-LAMP> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-KEY> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-FLASK> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-BONE> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-CHISEL> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-HELMET> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-CHAINMAIL> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-SWORD> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-GUARD-SWORD> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-GEM> <SET ANY T>)>
  <COND (<DROP-ALL-ONE ,OBJ-BACKPACK> <SET ANY T>)>
  <COND
    (<NOT .ANY>
      <TELL "You are carrying nothing." CR>)>>

<ROUTINE DO-DROP (OBJ)
  <COND
    (<NOT <PORTABLE? .OBJ>>
      <TELL "You are not carrying that." CR>)

    (<NOT <EQUAL? <OBJ-PLACE .OBJ> ,INVENTORY>>
      <TELL "You are not carrying it." CR>)

    (<AND <EQUAL? .OBJ ,OBJ-BACKPACK> <G? <CARRIED-COUNT> 2>>
      <TELL "You cannot drop the backpack while it still carries your gear." CR>)

    (T
      <SET-OBJ-PLACE .OBJ ,ROOM>
      <COND
        (<EQUAL? .OBJ ,OBJ-HELMET>
          <SETG AP <- ,AP 1>>
          <TELL "Dropped. Without the helmet, your AP is now " N ,AP "." CR>)
        (<EQUAL? .OBJ ,OBJ-CHAINMAIL>
          <SETG AP <- ,AP 2>>
          <TELL "Dropped. Without the chainmail, your AP is now " N ,AP "." CR>)
        (<EQUAL? .OBJ ,OBJ-BACKPACK>
          <TELL "Dropped. The old backpack slumps to the floor." CR>)
        (T
          <TELL "Dropped." CR>)>)>>

<ROUTINE DO-DRINK (OBJ)
  <COND
    (<NOT <EQUAL? .OBJ ,OBJ-FLASK>>
      <TELL "You cannot drink that." CR>)
    (<NOT <OBJ-ACCESSIBLE? ,OBJ-FLASK>>
      <TELL "You see no flask here." CR>)
    (T
      <TELL "You drink a mouthful of stale but precious water. Enough remains in
 the flask." CR>)>>

<ROUTINE DO-GIVE (OBJ NPC)
  <COND
    (<NOT <EQUAL? <OBJ-PLACE .OBJ> ,INVENTORY>>
      <TELL "You are not carrying it." CR>)
    (<EQUAL? .NPC ,OBJ-OLD-MAN>
      <COND
        (<NOT <OLD-MAN-HERE?>>
          <TELL "The old man is not here." CR>)
        (,OLD-MAN-DEAD
          <TELL "The old man is dead." CR>)
        (<NOT <EQUAL? .OBJ ,OBJ-FLASK>>
          <TELL "The old man looks at it, then shakes his head. He has no use for that." CR>)
        (,OLD-MAN-GOT-WATER
          <TELL "The old man has already taken the water." CR>)
        (T
          <SETG FLASK-PLACE ,NOWHERE>
          <SETG OLD-MAN-GOT-WATER T>
          <TELL "The old man clutches the flask with both claws and drinks as
though each drop were a stolen jewel. When he lowers it, some life has crept
back into his eyes." CR>
          <TELL "\"Listen,\" he whispers. \"I once heard the guards talking when
 they thought I was asleep. The key to the courtyard gate is not kept on a belt.
 They hid it in the dark alcove beyond the eastern corridor, under loose stones
where only a man with light would spy it.\"" CR>)>)
    (<EQUAL? .NPC ,OBJ-GUARD>
      <COND
        (,GUARD-DEAD
          <TELL "The guard is dead." CR>)
        (<NOT <GUARD-HERE?>>
          <TELL "The guard is not here." CR>)
        (T
          <SETG GUARD-ALERT T>
          <TELL "The guard knocks the offering aside. \"Keep your tricks, dog.\"" CR>)>)
    (T
      <TELL "There is no answer." CR>)>>

<ROUTINE DO-FREE-CHAINS (TOOL)
  <COND
    (<NOT <EQUAL? ,ROOM ,RM-CELL>>
      <TELL "There are no chains here." CR>)
    (<NOT ,PLAYER-CHAINED>
      <TELL "You are already free of the chains." CR>)
    (<NOT <EQUAL? .TOOL ,OBJ-BONE>>
      <TELL "The pin is too narrow for your fingers. You need something sharp." CR>)
    (<NOT <EQUAL? ,BONE-PLACE ,INVENTORY>>
      <TELL "You are not carrying the jagged bone." CR>)
    (T
      <SETG PLAYER-CHAINED <>>
      <TELL "You grind the jagged bone against the rusted pin until it gives
with a dry snap. The chains fall from your wrists." CR>)>>

<ROUTINE DO-TURN-RING ()
  <COND
    (<NOT <OBJ-ACCESSIBLE? ,OBJ-RING>>
      <TELL "You see no iron ring here." CR>)
    (,STONE-DOOR-OPEN
      <TELL "The iron ring has already awakened the hidden stone." CR>)
    (T
      <SETG STONE-DOOR-OPEN T>
      <TELL "You twist the iron ring. Stone groans like a beast under a spear,
and the eastern slab swings inward." CR>)>>

<ROUTINE DO-TURN-LEVER ()
  <COND
    (<NOT <LEVER-HERE?>>
      <TELL "You see no lever here." CR>)
    (,CISTERN-DRAINED
      <TELL "The lever is already down." CR>)
    (T
      <SETG CISTERN-DRAINED T>
      <TELL "You drag the lever down. Iron chains thunder in the dark, and the
Well of Black Waters roars away into unseen pits." CR>)>>

<ROUTINE DO-TURN (OBJ)
  <COND
    (<EQUAL? .OBJ ,OBJ-RING>
      <DO-TURN-RING>)
    (<EQUAL? .OBJ ,OBJ-LEVER>
      <DO-TURN-LEVER>)
    (<EQUAL? .OBJ ,OBJ-LAMP>
      <DO-LIGHT ,OBJ-LAMP>)
    (T
      <TELL "Nothing happens." CR>)>>

<ROUTINE DO-LIGHT (OBJ)
  <COND
    (<NOT <EQUAL? .OBJ ,OBJ-LAMP>>
      <TELL "That cannot be lit." CR>)

    (<NOT <OBJ-ACCESSIBLE? ,OBJ-LAMP>>
      <TELL "You see no lamp here." CR>)

    (,LAMP-LIT
      <TELL "The lamp is already lit." CR>)

    (T
      <SETG LAMP-LIT T>
      <TELL "The brass lamp sputters and begins to glow." CR>)>>

<ROUTINE DO-TURN-OFF (OBJ)
  <COND
    (<NOT <EQUAL? .OBJ ,OBJ-LAMP>>
      <TELL "That cannot be turned off." CR>)

    (<NOT <OBJ-ACCESSIBLE? ,OBJ-LAMP>>
      <TELL "You see no lamp here." CR>)

    (<NOT ,LAMP-LIT>
      <TELL "The lamp is already dark." CR>)

    (T
      <SETG LAMP-LIT <>>
      <TELL "You pinch the lamp's flame dead." CR>)>>

<ROUTINE DO-OPEN-CELL-DOOR ()
  <COND
    (<NOT <CELL-DOOR-HERE?>>
      <TELL "There is no cell door here." CR>)
    (,PLAYER-CHAINED
      <TELL "The chains snap taut before you can reach the door." CR>)
    (,CELL-DOOR-OPEN
      <TELL "The cell door is already open." CR>)
    (T
      <SETG CELL-DOOR-OPEN T>
      <TELL "You put your shoulder to the heavy cell door. It scrapes open with
a long, wet groan." CR>)>>

<ROUTINE DO-OPEN (OBJ)
  <COND
    (<EQUAL? .OBJ ,OBJ-CHAINS>
      <COND
        (<EQUAL? ,BONE-PLACE ,INVENTORY>
          <DO-FREE-CHAINS ,OBJ-BONE>)
        (T
          <DO-FREE-CHAINS ,OBJ-NONE>)>)

    (<EQUAL? .OBJ ,OBJ-CELL-DOOR>
      <DO-OPEN-CELL-DOOR>)

    (<EQUAL? .OBJ ,OBJ-RING>
      <DO-TURN-RING>)

    (<EQUAL? .OBJ ,OBJ-LEVER>
      <DO-TURN-LEVER>)

    (<EQUAL? .OBJ ,OBJ-STONE-DOOR>
      <COND
        (<NOT <STONE-DOOR-HERE?>>
          <TELL "There is no stone slab here." CR>)
        (,STONE-DOOR-OPEN
          <TELL "The stone slab is already open." CR>)
        (T
          <TELL "The slab has no handle. Some hidden engine must command it." CR>)>)

    (<NOT <EQUAL? .OBJ ,OBJ-GATE>>
      <TELL "That cannot be opened." CR>)

    (<NOT <GATE-HERE?>>
      <TELL "There is no gate here." CR>)

    (,GATE-OPEN
      <TELL "The iron gate is already open." CR>)

    (<NOT ,GATE-UNLOCKED>
      <TELL "The iron gate is locked." CR>)

    (T
      <SETG GATE-OPEN T>
      <TELL "The iron gate groans open." CR>)>>

<ROUTINE DO-CLOSE (OBJ)
  <COND
    (<EQUAL? .OBJ ,OBJ-CELL-DOOR>
      <COND
        (<NOT <CELL-DOOR-HERE?>>
          <TELL "There is no cell door here." CR>)
        (<NOT ,CELL-DOOR-OPEN>
          <TELL "The cell door is already closed." CR>)
        (T
          <SETG CELL-DOOR-OPEN <>>
          <TELL "You pull the heavy cell door closed." CR>)>)

    (<EQUAL? .OBJ ,OBJ-STONE-DOOR>
      <COND
        (<NOT <STONE-DOOR-HERE?>>
          <TELL "There is no stone slab here." CR>)
        (<NOT ,STONE-DOOR-OPEN>
          <TELL "The stone slab is already closed." CR>)
        (T
          <SETG STONE-DOOR-OPEN <>>
          <TELL "The stone slab grinds shut." CR>)>)

    (<NOT <EQUAL? .OBJ ,OBJ-GATE>>
      <TELL "That cannot be closed." CR>)

    (<NOT <GATE-HERE?>>
      <TELL "There is no gate here." CR>)

    (<NOT ,GATE-OPEN>
      <TELL "The iron gate is already closed." CR>)

    (T
      <SETG GATE-OPEN <>>
      <TELL "The iron gate groans shut." CR>)>>

<ROUTINE DO-UNLOCK (OBJ TOOL)
  <COND
    (<EQUAL? .OBJ ,OBJ-CHAINS>
      <DO-FREE-CHAINS .TOOL>)

    (<EQUAL? .OBJ ,OBJ-CELL-DOOR>
      <COND
        (<NOT <CELL-DOOR-HERE?>>
          <TELL "There is no cell door here." CR>)
        (T
          <TELL "The cell door is not locked." CR>)>)

    (<EQUAL? .OBJ ,OBJ-STONE-DOOR>
      <TELL "There is no keyhole in the stone slab." CR>)

    (<NOT <EQUAL? .OBJ ,OBJ-GATE>>
      <TELL "That cannot be unlocked." CR>)

    (<NOT <GATE-HERE?>>
      <TELL "There is no gate here." CR>)

    (,GATE-OPEN
      <TELL "The iron gate is already open." CR>)

    (,GATE-UNLOCKED
      <TELL "The iron gate is already unlocked." CR>)

    (<NOT <EQUAL? .TOOL ,OBJ-KEY>>
      <TELL "You need something suitable for the lock." CR>)

    (<NOT <EQUAL? ,KEY-PLACE ,INVENTORY>>
      <TELL "You are not carrying the rusty key." CR>)

    (T
      <SETG GATE-UNLOCKED T>
      <SETG GATE-OPEN T>
      <TELL "The rusty key turns with difficulty. The lock snaps open, and the
gate swings inward." CR>)>>

<ROUTINE DO-PRY-GEM (TOOL)
  <COND
    (<EQUAL? ,GEM-PLACE ,INVENTORY>
      <TELL "The black gem is already yours." CR>)
    (<NOT <EQUAL? ,ROOM ,RM-SHRINE>>
      <TELL "There is no black gem here." CR>)
    (,GEM-LOOSENED
      <TELL "The black gem is already pried loose." CR>)
    (<NOT <EQUAL? .TOOL ,OBJ-CHISEL>>
      <TELL "You need a thin, hard tool to free the gem from the altar." CR>)
    (<NOT <EQUAL? ,CHISEL-PLACE ,INVENTORY>>
      <TELL "You are not carrying the green bronze chisel." CR>)
    (T
      <SETG GEM-LOOSENED T>
      <TELL "You work the green bronze chisel under the gem. Stone claws crack
one by one, and the Night-Eye drops loose with a cold flash." CR>)>>

<ROUTINE DO-USE (OBJ TOOL)
  <COND
    (<AND <EQUAL? .OBJ ,OBJ-BONE> <EQUAL? .TOOL ,OBJ-CHAINS>>
      <DO-FREE-CHAINS ,OBJ-BONE>)

    (<AND <EQUAL? .OBJ ,OBJ-CHAINS> <EQUAL? .TOOL ,OBJ-BONE>>
      <DO-FREE-CHAINS ,OBJ-BONE>)

    (<EQUAL? .OBJ ,OBJ-CHAINS>
      <DO-FREE-CHAINS ,OBJ-NONE>)

    (<EQUAL? .OBJ ,OBJ-BONE>
      <TELL "You jab the bone at the air. Nothing useful happens." CR>)

    (<AND <EQUAL? .OBJ ,OBJ-CHISEL> <EQUAL? .TOOL ,OBJ-GEM>>
      <DO-PRY-GEM ,OBJ-CHISEL>)

    (<AND <EQUAL? .OBJ ,OBJ-GEM> <EQUAL? .TOOL ,OBJ-CHISEL>>
      <DO-PRY-GEM ,OBJ-CHISEL>)

    (<EQUAL? .OBJ ,OBJ-CHISEL>
      <COND
        (<EQUAL? ,ROOM ,RM-SHRINE>
          <DO-PRY-GEM ,OBJ-CHISEL>)
        (T
          <TELL "You scrape the chisel against the stone. Nothing stirs." CR>)>)

    (<EQUAL? .OBJ ,OBJ-KEY>
      <COND
        (<AND <OR <EQUAL? .TOOL ,OBJ-GATE> <EQUAL? .TOOL ,OBJ-NONE>> <GATE-HERE?>>
          <DO-UNLOCK ,OBJ-GATE ,OBJ-KEY>)
        (T
          <TELL "The key does not seem useful here." CR>)>)

    (<EQUAL? .OBJ ,OBJ-LAMP>
      <DO-LIGHT ,OBJ-LAMP>)

    (<EQUAL? .OBJ ,OBJ-CELL-DOOR>
      <DO-OPEN-CELL-DOOR>)

    (<EQUAL? .OBJ ,OBJ-RING>
      <DO-TURN-RING>)

    (<EQUAL? .OBJ ,OBJ-LEVER>
      <DO-TURN-LEVER>)

    (<EQUAL? .OBJ ,OBJ-STONE-DOOR>
      <COND
        (<NOT <STONE-DOOR-HERE?>>
          <TELL "There is no stone slab here." CR>)
        (,STONE-DOOR-OPEN
          <TELL "The stone slab is already open." CR>)
        (T
          <TELL "The slab has no handle. Some hidden engine must command it." CR>)>)

    (T
      <TELL "Nothing useful happens." CR>)>>

<ROUTINE DO-SEARCH (OBJ)
  <COND
    (<DARK-ROOM?>
      <TELL "It is too dark to search effectively." CR>)
    (<AND <EQUAL? .OBJ ,OBJ-CORPSE> <CORPSE-HERE?>>
      <REVEAL-GUARD-LOOT>)
    (<AND <EQUAL? .OBJ ,OBJ-NONE> <CORPSE-HERE?>>
      <REVEAL-GUARD-LOOT>)
    (<AND <EQUAL? ,ROOM ,RM-CELL> ,PLAYER-CHAINED <EQUAL? ,BONE-PLACE ,NOWHERE>>
      <SETG BONE-PLACE ,RM-CELL>
      <TELL "Under the rotten straw your fingers close on a jagged bone, sharp enough to worry at the rusted pin of your chains." CR>
      <SET-LAST-OBJECT ,OBJ-BONE>)
    (<AND <EQUAL? ,ROOM ,RM-CELL> ,PLAYER-CHAINED>
      <TELL "The rusted pin in the chains waits for some narrow, sharp tool." CR>
      <SET-LAST-OBJECT ,OBJ-CHAINS>)
    (<AND <EQUAL? ,ROOM ,RM-CELL> <NOT ,CELL-DOOR-OPEN>>
      <TELL "The heavy door in the north wall is closed, but there is no lock on this side." CR>
      <SET-LAST-OBJECT ,OBJ-CELL-DOOR>)
    (<AND <EQUAL? ,ROOM ,RM-ALCOVE> <EQUAL? ,KEY-PLACE ,RM-ALCOVE>>
      <TELL "Searching the scratches in the floor reveals a rusty key." CR>
      <SET-LAST-OBJECT ,OBJ-KEY>)
    (<EQUAL? ,ROOM ,RM-ARMORY>
      <TELL "The warped hatch north of the racks might yield to a sword blade." CR>)
    (<EQUAL? ,ROOM ,RM-NICHE>
      <COND
        (<EQUAL? ,RING-PLACE ,NOWHERE>
          <SETG RING-PLACE ,RM-NICHE>
          <TELL "Behind a moldy shelf you uncover an iron ring set deep into the
 stone." CR>
          <SET-LAST-OBJECT ,OBJ-RING>)
        (T
          <TELL "You find only dust, claw-marks, and the stink of ancient rot." CR>)>)
    (<EQUAL? ,ROOM ,RM-VAULT>
      <TELL "The shattered urns hide nothing but dust and old spider husks. The
stair down exhales air as cold as a dead man's mouth." CR>)
    (<EQUAL? ,ROOM ,RM-SERPENT-STAIR>
      <TELL "You test the wet steps. One cracked stair shifts under your boot, 
but you mark it before it can betray you." CR>)
    (<EQUAL? ,ROOM ,RM-SPEAR-HALL>
      <COND
        (<NOT ,SPEAR-TRAP-SEEN>
          <SETG SPEAR-TRAP-SEEN T>
          <TELL "You study the murder-holes and find a pressure-stone before the
 eastern arch. You now know where to step." CR>)
        (T
          <TELL "The spear trap is plain to you now: old iron in black slots,
hungry but avoidable." CR>)>)
    (<EQUAL? ,ROOM ,RM-PIT-BRIDGE>
      <COND
        (<NOT ,PIT-TRAP-SEEN>
          <SETG PIT-TRAP-SEEN T>
          <TELL "You brush dust from the bridge and find a cracked flagstone
over the pit. You will not trust your weight to it." CR>)
        (T
          <TELL "The false flagstone gapes slightly, showing blackness between
its teeth." CR>)>)
    (<EQUAL? ,ROOM ,RM-BONE-CHAMBER>
      <COND
        (<NOT ,DART-TRAP-SEEN>
          <SETG DART-TRAP-SEEN T>
          <COND
            (<EQUAL? ,CHISEL-PLACE ,NOWHERE>
              <SETG CHISEL-PLACE ,RM-BONE-CHAMBER>
              <TELL "You peer into the skulls and see tiny drilled mouths. There
 are darts inside, but the old trigger can be avoided. Beneath one jaw lies a
green bronze chisel." CR>
              <SET-LAST-OBJECT ,OBJ-CHISEL>)
            (T
              <TELL "You peer into the skulls and see tiny drilled mouths. There
 are darts inside, but the old trigger can be avoided." CR>)>)
        (<EQUAL? ,CHISEL-PLACE ,NOWHERE>
          <SETG CHISEL-PLACE ,RM-BONE-CHAMBER>
          <TELL "In a bone niche you find a green bronze chisel, narrow and cold
 as a serpent's fang." CR>
          <SET-LAST-OBJECT ,OBJ-CHISEL>)
        (T
          <TELL "The dart mouths in the skulls stare blindly, their trick
betrayed." CR>)>)
    (<EQUAL? ,ROOM ,RM-CISTERN>
      <COND
        (<NOT ,LEVER-REVEALED>
          <SETG LEVER-REVEALED T>
          <TELL "You grope along the sweating wall and uncover a rusted lever
above the Well of Black Waters." CR>
          <SET-LAST-OBJECT ,OBJ-LEVER>)
        (,CISTERN-DRAINED
          <TELL "In the drained slime you see the low eastern arch,
black-mouthed and waiting. The lever hangs down, its work done." CR>
          <SET-LAST-OBJECT ,OBJ-LEVER>)
        (T
          <TELL "The rusted lever waits above the black water. It may drain the
well." CR>
          <SET-LAST-OBJECT ,OBJ-LEVER>)>)
    (<EQUAL? ,ROOM ,RM-SHRINE>
      <COND
        (,GEM-LOOSENED
          <TELL "The black gem lies loose on the cracked altar." CR>)
        (T
          <TELL "The cracked altar holds the black gem like an idol's single
baleful eye. Stone claws grip it tightly; only a narrow hard tool could worry it
 free." CR>)>
      <SET-LAST-OBJECT ,OBJ-GEM>)
    (T
      <TELL "You find nothing of interest." CR>)>>

<ROUTINE DO-KILL (OBJ)
  <COND
    (,PLAYER-CHAINED
      <TELL "The chains bind your wrists. You cannot strike a killing blow until
 you are free." CR>)
    (<EQUAL? .OBJ ,OBJ-OLD-MAN>
      <DO-KILL-OLD-MAN>)
    (<NOT <EQUAL? .OBJ ,OBJ-GUARD>>
      <TELL "Violence is not useful here." CR>)
    (,GUARD-DEAD
      <TELL "The guard is already dead." CR>)
    (<NOT <GUARD-HERE?>>
      <TELL "The guard is not here." CR>)
    (T
      <FIGHT-GUARD-ROUND>)>>

