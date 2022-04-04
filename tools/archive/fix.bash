#!/bin/bash

ar=../tools/archive
for ufo in *.ufo
do
    psfsetversion $ufo 0.202
    $ar/reverse-direction.py $ufo
done
psfgetglyphnames -i $ar/copy-regular.txt Bailey-R*.ufo glyphs.csv
psfcopyglyphs --unicode usv -s Bailey-R*.ufo -i glyphs.csv Bailey-B*.ufo # --rename rename
psfcopyglyphs -s Bailey-B*.ufo -i $ar/copy-bold.csv Bailey-R*.ufo

psfbuildcompgc -i $ar/decomposites-bold.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/decomposites.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/decomposites.glyphConstruction Bailey-R*.ufo

$ar/composites.py Bailey-B*.ufo
$ar/composites.py Bailey-R*.ufo

psfbuildcompgc -i $ar/composites-bold.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/composites.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/composites.glyphConstruction Bailey-R*.ufo

psfdeleteglyphs -i $ar/delete-bold.txt Bailey-B*.ufo
psfdeleteglyphs -i $ar/delete.txt Bailey-B*.ufo
psfdeleteglyphs -i $ar/delete.txt Bailey-R*.ufo

psfrenameglyphs -i $ar/rename-bold.csv Bailey-B*.ufo
psfrenameglyphs -i $ar/rename.csv Bailey-B*.ufo
psfrenameglyphs -i $ar/rename.csv Bailey-R*.ufo
psfsetunicodes -i $ar/encode-bold.csv Bailey-B*.ufo

# import more characters
$HOME/script/tools/anchor-keep.py mark Bailey-B*.ufo
$HOME/script/tools/anchor-keep.py mark Bailey-R*.ufo

## import more Latin characters
gentium=$HOME/script/latn/fonts/gentium_local/instances
psfgetglyphnames -a ~/script/smithplus/etc/glyph_names/glyph_names.csv -i $ar/main_import.txt $gentium/GentiumBookPlus-Regular.ufo glyphs.csv
psfcopyglyphs --rename rename --unicode usv --scale 0.91 -s $gentium/GentiumPlus-Bold.ufo        -i glyphs.csv Bailey-B*.ufo
psfcopyglyphs --rename rename --unicode usv --scale 0.91 -s $gentium/GentiumBookPlus-Regular.ufo -i glyphs.csv Bailey-R*.ufo

## import Devanagari characters
panini=$HOME/script/deva/fonts/panini/source
psfgetglyphnames -a ~/script/smithplus/etc/glyph_names/glyph_names.csv -i $ar/deva_import.txt $panini/Panini-Regular.ufo glyphs.csv
psfcopyglyphs --rename rename --unicode usv -s $panini/Panini-Bold.ufo    -i glyphs.csv Bailey-B*.ufo
psfcopyglyphs --rename rename --unicode usv -s $panini/Panini-Regular.ufo -i glyphs.csv Bailey-R*.ufo

## finish importing other characters
$HOME/script/tools/anchor-keep.py only Bailey-B*.ufo
$HOME/script/tools/anchor-keep.py only Bailey-R*.ufo

# fix width of space characters
$HOME/script/tools/fix-spaces.py Bailey-B*.ufo
$HOME/script/tools/fix-spaces.py Bailey-R*.ufo

# set line spacing
$HOME/script/tools/line_spacing.py Bailey-B*.ufo
$HOME/script/tools/line_spacing.py Bailey-R*.ufo
