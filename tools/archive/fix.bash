ar=../tools/archive
for ufo in *.ufo
do
    psfsetversion $ufo 0.200
    $ar/reverse-direction.py $ufo
done
psfrenameglyphs -i $ar/rename-bold.csv Bailey-B*.ufo
psfgetglyphnames -i $ar/copy.txt Bailey-R*.ufo glyphs.csv
psfcopyglyphs --unicode usv -s Bailey-R*.ufo -i glyphs.csv Bailey-B*.ufo # --rename rename
