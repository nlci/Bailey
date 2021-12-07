ar=../tools/archive
for ufo in *.ufo
do
    psfsetversion $ufo 0.200
    $ar/reverse-direction.py $ufo
done
psfrenameglyphs -i $ar/rename-bold.csv Bailey-B*.ufo
psfgetglyphnames -i $ar/copy.txt Bailey-R*.ufo glyphs.csv
psfcopyglyphs --unicode usv -s Bailey-R*.ufo -i glyphs.csv Bailey-B*.ufo # --rename rename

psfbuildcompgc -i $ar/decomposites-bold.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/decomposites.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/decomposites.glyphConstruction Bailey-R*.ufo

$ar/composites.py Bailey-B*.ufo
$ar/composites.py Bailey-R*.ufo

psfbuildcompgc -i $ar/composites-bold.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/composites.glyphConstruction Bailey-B*.ufo
psfbuildcompgc -i $ar/composites.glyphConstruction Bailey-R*.ufo

psfdeleteglyphs -i $ar/delete.txt Bailey-B*.ufo
psfdeleteglyphs -i $ar/delete.txt Bailey-R*.ufo
