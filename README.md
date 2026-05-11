# darkzil

**darkzil** is a small ZIL/Z-machine project template for creating **Z3 text
adventure games**, with special care for running on **Atari 8-bit computers**.

It is intended for compact, old-school interactive fiction: dungeon crawls,
sword-and-sorcery adventures, parser experiments, and Infocom-style games that
should remain compatible with constrained 8-bit targets.

## Purpose

The goal of this project is to provide a simple, understandable base for
writing Z-machine Version 3 games in ZIL.

The code is kept deliberately small and conservative so that games can run
not only in modern interpreters such as Frotz, but also on classic Atari
8-bit computers.

## Features

* Z-machine Version 3 / Z3 target
* Atari 8-bit friendly design
* Small custom parser
* Compact standard-library style support file
* Room, object, inventory, and movement handling
* Basic verbs such as:

  * `LOOK`
  * `EXAMINE`
  * `SEARCH`
  * `TAKE/GET`
  * `DROP`
  * `OPEN`
  * `CLOSE`
  * `USE`
  * `TALK`
  * `GIVE`
  * `KILL`
  * `SAVE`
  * `RESTORE`
  * `RESTART`
  * `QUIT`
* Confirmation prompts for dangerous actions
* Support for old-style adventure mechanics:

  * locked doors
  * light sources
  * traps
  * puzzle objects
  * room descriptions
  * inventory state
* Conversation System
* Novel RPG elements based on DarkRPG system:

  * attributes
  * combat
  * automatic or manual dice rolls


## DarkRPG

**DarkRPG** is a general-purpose tabletop role-playing game system created by
Andy Kosela. It is designed as a simple, flexible rules framework for running
old-school fantasy, sword-and-sorcery, dungeon-crawling, or science-fiction
adventure campaigns. Rather than being tied to a single setting, **DarkRPG**
provides a compact foundation for characters, conflict, exploration, and
game-master adjudication, allowing it to be adapted to different worlds, tones,
and styles of play.

The system draws on many years of experience with some of the most influential
role-playing games in the history of the hobby, including **Basic D&D**,
**AD&D**, **Traveller**, **GURPS**, **Warhammer Fantasy Roleplay**,
**RuneQuest**, **Cyberpunk 2020**, **Fighting Fantasy**, **QuestGame**, and
**MERP**. It aims to preserve the clarity, danger, imagination, and freedom of
classic RPG design while keeping the rules compact and practical for actual
play.

Both **DarkZIL** and **DarkRPG** projects are interconnected with Andy Kosela's
**DarkSim**, a 3D simulation engine based on Looking Glass Studios' Dark Engine
powering Thief: The Dark Project and System Shock 2 games.

## Attributes

The game uses a small RPG attribute system called **DarkRPG**.

To display your current attributes, type:

```text
A
```

The game prints:

```text
S:<value>, D:<value>, K:<value>, W:<value>, HP:<value>, AP:<value>
```

The attributes are:

```text
S  Strength
D  Dexterity
K  Knowledge
W  Weapon skill
HP Health points
AP Armor points
```

### Strength / S

Strength shows how physically strong the player is.

It affects starting health:

```text
HP = 6 + S
```

A weak character has fewer hit points.

A strong character has more hit points.

### Dexterity / D

Dexterity shows how quick and agile the player is.

It is displayed as part of the character sheet and may be used by the game for
agility-style checks.

### Knowledge / K

Knowledge shows what study, learning, and practical understanding the player
has.

It is displayed as part of the character sheet and may be used by the game for
knowledge-based checks.

### Weapon Skill / W

Weapon skill shows how well the player fights with weapons.

It is added to the player's combat roll:

```text
player attack = 1d6 + W
```

Higher Weapon skill makes the player more likely to win in combat.

### Health Points / HP

Health points show how much injury the player can survive.

If HP falls to zero, the player dies.

When killed, the game prints a game-over message and asks whether to restart.

### Armor Points / AP

Armor points reduce incoming damage.

Armor items increase AP.

Examples:

```text
dented iron helmet      AP +1
shirt of dark chainmail AP +2
```

Incoming damage is reduced like this:

```text
final damage = raw damage - AP
```

Damage cannot go below zero.

If armor reduces damage to zero, the blow is stopped.

To see the in-game RPG help, type:

```text
RPG
```

---

## Starting Attribute Rolls

Starting attributes are rolled at the beginning of the game.

Each attribute is rolled with **2d6**.

The 2d6 result is converted into an attribute modifier:

```text
2-4    = -1
5-8    =  0
9-10   = +1
11-12  = +2
```

The game rolls:

```text
Strength/S
Dexterity/D
Knowledge/K
Weapon/W
```

Then HP is calculated:

```text
HP = 6 + S
```

Example:

```text
S:1, D:0, K:1, W:2, HP:7, AP:0
```

This means:

```text
S  +1  strong
D   0  average
K  +1  learned
W  +2  expert
HP  7
AP  0
```

---

## Combat

Combat is simple and round-based.

Use:

```text
KILL <npc>
```

or the short form:

```text
K <npc>
```

Examples:

```text
KILL GUARD
K GUARD
```

If there is only one obvious enemy in the room, you can usually type:

```text
KILL
```

or:

```text
K
```

and the game will choose that target automatically.

You cannot fight properly while chained. Free yourself first.

### Guard Combat

When fighting the guard, one combat round happens each time you attack.

The combat round compares:

```text
player roll = 1d6 + W
guard roll  = 1d6 + guard W
```

The game prints both results.

Example:

```text
You roll 5; the guard rolls 3.
```

If the player rolls higher, the player hits the guard.

If the guard rolls higher, the guard hits the player.

If both rolls are equal, neither side gains the advantage.

### Player Damage

If the player has a sword, player damage is:

```text
1d6
```

The old sword and the guard's sword both do normal sword damage.

If the player fights without a sword, damage is much weaker.

Bare-handed damage is reduced from the 1d6 roll:

```text
1      = 0 damage
2-3    = 1 damage
4-5    = 2 damage
6      = 3 damage
```

The guard has armor, so bare-handed attacks are usually useless against him.

In practice, find a sword before trying to kill the guard.

### Guard Armor

The guard has armor:

```text
guard AP = 3
```

After the player rolls damage, the guard's AP reduces it.

Example:

```text
raw damage = 5
guard AP   = 3
final damage = 2
```

If final damage is zero, the game prints that the guard's helm and chainmail turn the blow.

### Guard Damage

If the guard wins the combat roll, he rolls:

```text
1d6 damage
```

Your AP reduces this damage.

Example:

```text
raw damage = 4
your AP    = 2
final damage = 2
```

If your AP reduces damage to zero, your armor turns the blow.

### Wasting Turns Near the Guard

If the guard is present and threatening, wasting time is dangerous.

Commands that are not movement and not an attack against the guard may allow him to strike you.

The guard's punishment strike does:

```text
2 damage
```

So if the guard is in the room, do not waste turns unless you are ready to take a hit.

---

## Automatic and Manual Dice Rolls

The game supports both automatic and manual dice rolls.

By default, dice rolls are **automatic**.

In automatic mode, the game rolls internally.

To toggle dice mode, type:

```text
DICE
```

When manual dice mode is turned on, the game prints:

```text
Manual dice rolls are now on. Roll real dice and type the result when asked.
For manual starting attributes, type RESTART now.
```

When manual dice mode is turned off, the game prints:

```text
Automatic dice rolls are now on.
```

### Manual 1d6 Rolls

For a 1d6 roll, roll one real six-sided die and type the result.

Example prompt:

```text
Roll 1d6 for your attack:
```

Valid input:

```text
1
2
3
4
5
6
```

### Manual 2d6 Rolls

For a 2d6 roll, roll two real six-sided dice and type the total.

Example prompt:

```text
Roll 2d6 for Strength/S (2-12):
```

Valid input:

```text
2
3
4
5
6
7
8
9
10
11
12
```

If the number is outside the valid range, the game asks again.

### Manual Starting Attributes

Starting attributes are rolled when the game starts.

If you want to roll starting attributes manually, do this:

```text
DICE
RESTART
```

After restart, the game asks you to manually enter the 2d6 totals for:

```text
Strength/S
Dexterity/D
Knowledge/K
Weapon/W
```

### Dice Used in Combat

Combat uses dice rolls for attack and damage.

Player attack:

```text
1d6 + W
```

Guard attack:

```text
1d6 + guard W
```

Player sword damage:

```text
1d6
```

Guard damage:

```text
1d6
```

In automatic mode, the game rolls these internally.

In manual mode, you roll real dice and type the result.

## Conversation System

The game includes a menu-based conversation system for NPCs.

To start a conversation, type:

```text
TALK TO <npc>
```

When a conversation begins, the game displays a list of dialogue choices
marked with letters:

```text
The old man lifts his head. His beard is white with dust and his eyes gleam in the gloom.

Ask the old man about:
  A. Himself
  B. The guard
  C. The deep places
  D. End conversation
```

The final option always ends the conversation and returns to normal
command mode.

While in conversation mode, normal movement and object commands are not
used. Choose one of the displayed letter options to continue or end the
conversation.

## Carrying Items

The game uses a simple carrying limit.

At the start, you can carry only **2 items**, representing what you can hold in your hands.

An **old backpack** can be found in the **Old Armory**.

Once you take the backpack, your carrying limit increases to **10 items total**:

```text
2 items in your hands
8 more items in the backpack
```

The inventory command does not print item counts. It only lists what you are carrying.

Use:

```text
INVENTORY
```

or:

```text
I
```

To take everything visible in the current room:

```text
TAKE ALL
GET ALL
G ALL
```

To drop everything you are carrying:

```text
DROP ALL
```

`DROP ALL` drops the backpack last, so it works even when you are carrying more than two items.

If you are carrying more than two items, you cannot drop the backpack by itself. You must drop enough items first.

## Engine Console / System Monitor

The game includes a small hidden engine console. It behaves like a minimal
system monitor/debugger rather than an in-world magic system.

Enter it from normal gameplay with either:

```text
CONSOLE
```

or:

```text
CON
```

The game then asks for a password:

```text
PASSWORD:
```

The password is:

```text
zork
```

Successful login prints:

```text
220 SYS MONITOR READY. Q=RTS.
```

The normal game prompt `>` changes to the console prompt `*`.

Exit the console with:

```text
Q
```

or:

```text
QUIT
```

The console exits with:

```text
221 RTS.
```

Console commands do not advance normal game turns.

## Console Opcodes

| Opcode | Arguments | Meaning |
|---|---|---|
| `HLP` | none | Print console help. |
| `WHE` | none | Print current room, turn count, HP/AP, attributes, lamp state, and guard state. |
| `FLG` | none | Dump important game flags. |
| `ROM` | none | Print the room symbol table: available room addresses for `GOT`. |
| `FIL` | none | Print the files (objects) symbol table. |
| `GOT` | room address | Teleport to a room. |
| `GET` | object file | Force an object into inventory. |
| `DRP` | object file | Drop an object into the current room. |
| `HEA` | none | Restore HP to derived maximum: `6 + S`. |
| `HUR` | none | Subtract 1 HP. |
| `KIL` | none | Kill/disable the guard. |
| `OPN` | none | Force-open or patch the relevant local barrier. |
| `FRE` | none | Clear the starting chain flag. |
| `DRN` | none | Reveal the lever and mark the well as drained. |
| `LIT` | none | Put lamp in inventory and mark it lit. |
| `DUS` | none | Mark lamp dark/unlit. |
| `REV` | none | Reveal or mark local hidden content/trap state. |
| `Q` | none | Exit console, like `RTS`. |
| `QUIT` | none | Exit console, like `RTS`. |

## Room Address Arguments

Use these with `GOT`:

```text
CEL HAL ARM COR GRD ALC NIC CRT VLT STA SPR BRG BON WEL SHR
```

| Address | Room |
|---|---|
| `CEL` | Starting cell |
| `HAL` | Dungeon hall |
| `ARM` | Old armory |
| `COR` | East corridor |
| `GRD` | Guard room |
| `ALC` | Dark alcove |
| `NIC` | Hidden niche |
| `CRT` | Ruined court |
| `VLT` | Vault |
| `STA` | Stair |
| `SPR` | Spear room |
| `BRG` | Bridge |
| `BON` | Bone room |
| `WEL` | Black well |
| `SHR` | Forgotten shrine |

Example:

```text
*GOT WEL 
250 CWD OK.
```

## Object File Arguments

Use these with `GET` and `DRP`:

```text
BON BPK CHS FLA GEM GSW HEL KEY LMP MAL SWD
```

| File | Object |
|---|---|
| `BON` | Bone |
| `BPK` | Backpack |
| `CHS` | Chisel |
| `FLA` | Flask of water |
| `GEM` | Gem |
| `GSW` | Guard sword |
| `HEL` | Helmet |
| `KEY` | Key |
| `LMP` | Lamp |
| `MAL` | Chainmail |
| `SWD` | Sword |

Examples:

```text
*GET SWD
226 RETR OK.
```

```text
*DRP SWD
250 STOR OK.
```

## Example Console Session

```text
>CON
PASSWORD:zork
220 SYS MONITOR READY. Q=RTS.
*HLP
OPCODES:
 HLP dir        WHE pwd/stat
 FLG flag dump  ROM symtab
 GOT <addr>     GET <file>
 DRP <file>     HEA restore hp
 HUR damage     KIL kill guard
 OPN patch door FRE free chain
 DRN drain      LIT lamp on
 DUS lamp off   REV reveal
 Q / QUIT       FIL symtab
211 END
*WHE
257 CWD=Well of Black Waters
213 TURNS=0 HP=8 AP=0
213 S=2 D=1 K=0 W=1
213 LAMP=DARK
213 GUARD-HP=6
*GOT SHR 
250 CWD OK.
*GET SWD
226 RETR OK.
*HEA
250 HP RESTORED.
*Q
221 RTS.
>
```

## Changing the default console password

By default, the console password is:

```text
zork
```

The password check is implemented in `minilib.zil`, in these routines:

```zil
<ROUTINE SYS-VEC? ...>
<ROUTINE SYS-VEC-S? ...>
```

The password is not stored directly as the plain text word `zork`. Instead, each character is checked as a small numeric value.

The current password:

```text
zork
```
is encoded as:

```text
z = 122 - 100 = 22
o = 111 - 100 = 11
r = 114 - 100 = 14
k = 107 - 100 = 7
```

So the current password check in `SYS-VEC?` looks like this:

```zil
<COND
  (<EQUAL? .N 1> <EQUAL? <- .L 100> 22>)
  (<EQUAL? .N 2> <EQUAL? <- .L 100> 11>)
  (<EQUAL? .N 3> <EQUAL? <- .L 100> 14>)
  (<EQUAL? .N 4> <EQUAL? <- .L 100> 7>)
  (T <RFALSE>)>>
```

To change the password, choose a new lowercase password and convert every
character like this:

```text
character ASCII code - 100
```

For example, to change the password to:

```text
doom
```

calculate:

```text
d = 100 - 100 = 0
o = 111 - 100 = 11
o = 111 - 100 = 11
m = 109 - 100 = 9
```

Then replace the values in `SYS-VEC?` with:

```zil
<COND
  (<EQUAL? .N 1> <EQUAL? <- .L 100> 0>)
  (<EQUAL? .N 2> <EQUAL? <- .L 100> 11>)
  (<EQUAL? .N 3> <EQUAL? <- .L 100> 11>)
  (<EQUAL? .N 4> <EQUAL? <- .L 100> 9>)
  (T <RFALSE>)>>
```

If the new password has a different length, also update the length check in `SYS-VEC-S?`.

For the current four-letter password, the check is:

```zil
(<NOT <EQUAL? .LEN 4>>
  <RFALSE>)
```

For a five-letter password, change it to:

```zil
(<NOT <EQUAL? .LEN 5>>
  <RFALSE>)
```

Then add another character check in the same routine.

For example, a five-letter password would need five checks:

```zil
<AND
  <SYS-VEC? <GETB ,INBUF .POS> 1>
  <SYS-VEC? <GETB ,INBUF <+ .POS 1>> 2>
  <SYS-VEC? <GETB ,INBUF <+ .POS 2>> 3>
  <SYS-VEC? <GETB ,INBUF <+ .POS 3>> 4>
  <SYS-VEC? <GETB ,INBUF <+ .POS 4>> 5>>
```

Then also add the fifth value in `SYS-VEC?`:

```zil
(<EQUAL? .N 5> <EQUAL? <- .L 100> VALUE>)
```

Replace `VALUE` with the calculated value for the fifth character.

For best compatibility with old Z-machine V3 interpreters, keep the password
short and use only simple lowercase letters `a` to `z`.

## Project Structure

```text
darkzil/
├── darkpit.zil      # Main game source
├── minilib.zil      # Minimal support library / parser / common routines
├── a8.bin.green     # Atari 8-bit Z-machine interpreter, green-screen variant
├── a8.bin.amber     # Atari 8-bit Z-machine interpreter, amber-screen variant
├── zil              # Build/run helper script
└── README.md
```

## Installing

Copy **zil** and **a8.bin** files to your **/usr/local/bin**.
Make **zil** executable.

## Building

This project is intended to be built with **ZILF**. It also includes its
own wrapper tool, **zil**, which handles most build and workflow tasks.

Example:

```sh
zil darkpit.zil
```

This should produce a Z-machine story file, usually with a `.z3` extension
plus Atari double density (dd) ATR disk image.

You can download **ZILF** from [https://zilf.io](https://zilf.io)

## Target Platform

The main target is:

```text
Z-machine Version 3
Atari 8-bit
```

The code avoids relying on modern interpreter conveniences where possible.

Because Atari 8-bit interpreters are much stricter and more memory-constrained
than modern ones, the project tries to follow old Infocom-style limitations.

## Important Z3 / Atari Notes

When writing new content, keep these constraints in mind:

### Keep vocabulary short

Z3 vocabulary words are limited. In practice, keep parser words short and
avoid long synonyms.

Good:

```zil
(SYNONYM DOOR GATE)
```

Risky:

```zil
(SYNONYM MANACLES SHACKLES)
```

Long words may fail compilation or behave badly on older interpreters.

### Avoid huge object tables

Z3 games have stricter memory and object limits than later Z-machine
versions. Keep object count reasonable.

### Let interpreters wrap text

For portability, avoid manually breaking every line for a 40-column
screen. Instead, write paragraph-style text and let each interpreter wrap
naturally.

Good:

```zil
<TELL "The corridor bends beneath the earth, its stones black with damp and age." CR CR>
```

Avoid hard-wrapping prose unless absolutely necessary.

### Keep parser logic simple

This project uses a small manual parser rather than a full Infocom
library. When adding a new command, make sure it is wired into the actual
dispatch logic, not only added as a vocabulary synonym.

## Release and Serial Number

The release number can be set in the source with:

```zil
<CONSTANT RELEASEID 0>
```

The serial number is normally generated from the build date in `YYMMDD` format.

Example:

```text
Release 0 / Serial number 260506
```

To print the release and serial number at startup, the game must explicitly
print them in its banner routine.

## Example Game

The included `darkpit.zil` is a small sword-and-sorcery dungeon adventure demo.

It includes:

* an opening prison cell
* chains puzzle
* guard encounter
* lamp/light mechanics
* dungeon rooms
* traps
* final black gem puzzle

It is meant both as a playable demo and as a reference for building your
own Z3 adventure.

## Design Philosophy

darkzil favors:

* small code
* predictable behavior
* old interpreter compatibility
* readable ZIL
* simple adventure mechanics
* manual control over parser behavior

It does not try to be a complete Inform-like library. It is closer to
a compact framework for learning and experimenting with ZIL on real or
emulated 8-bit machines.

## Development Tips

When adding new rooms:

1. Define the room object.
2. Add exits.
3. Add room description text.
4. Add any room-specific search or trap logic.
5. Test movement in both Frotz and an Atari emulator.

When adding new objects:

1. Add a constant/object ID if needed.
2. Add vocabulary.
3. Add placement/state globals if the object moves.
4. Add it to room/object printing.
5. Add take/drop/inventory behavior if portable.
6. Add special verb handling if it is part of a puzzle.

When adding new verbs:

1. Add vocabulary words.
2. Add parser dispatch handling.
3. Add the action routine.
4. Add help text.
5. Test abbreviations manually.

## Compatibility Goal

A game built with darkzil should ideally work in:

* Frotz
* Bocfel
* Parchment ([play it online](https://iplayif.com/?story=https%3A%2F%2Fgithub.com%2Fakosela%2Fdarkzil%2Fraw%2Frefs%2Fheads%2Fmaster%2Fdarkpit.z3))
* other modern Z-machine interpreters
* Atari 8-bit computers

The Atari target is the strictest one, so if something works there, it will
usually work elsewhere.

## License

```text
MIT License
```

## Status

Experimental but usable.

darkzil is intended as a practical base for Z3 adventure games, especially
those meant to feel at home on classic Atari 8-bit systems.

