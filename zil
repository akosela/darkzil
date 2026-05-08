#!/usr/bin/env bash

# Copyright (c) 2026 Andy Kosela
# MIT License

zilf $1
game="${1%.zil}"
cat ~/data/prog/zil/darkpit/a8.bin.green $game.z3 > $game.atr
#cat ~/data/prog/zil/darkpit/a8.bin.amber $game.z3 > $game.atr
size=`ls -l $game.atr |cut -d' ' -f5`
#head --bytes $((92176-$size)) /dev/zero >> $game.atr
head --bytes $((184336-$size)) /dev/zero >> $game.atr
