rm -rf Bailey-*.ufo
for sfd in ../*.sfd
do
    echo $sfd
    fontfilename="$(basename $sfd .sfd)"
    fontforge -script ../tools/archive/sfd2ufo.ff $sfd ${fontfilename}.ufo3
    mv -v ${fontfilename}.ufo3 ${fontfilename}.ufo
done
mv -v Rachana-Bold.ufo Bailey-Bold.ufo
mv -v Rachana-Regular.ufo Bailey-Regular.ufo
psfnormalize -p backup=0 -v 3 -p checkfix=none Bailey-B*.ufo
psfnormalize -p backup=0 -v 3 -p checkfix=none Bailey-R*.ufo
psfsetkeys -p backup=0 -k familyName -v Bailey Bailey-B*.ufo
psfsetkeys -p backup=0 -k familyName -v Bailey Bailey-R*.ufo
psfsetkeys -p backup=0 -k openTypeNamePreferredFamilyName -v Bailey Bailey-B*.ufo
psfsetkeys -p backup=0 -k openTypeNamePreferredFamilyName -v Bailey Bailey-R*.ufo
psfsetkeys -p backup=0 -k postscriptFullName -v "Bailey Bold" Bailey-B*.ufo
psfsetkeys -p backup=0 -k postscriptFullName -v "Bailey Regular" Bailey-R*.ufo
psfsetkeys -p backup=0 -k styleMapFamilyName -v "Bailey" Bailey-B*.ufo
psfsetkeys -p backup=0 -k styleMapFamilyName -v "Bailey" Bailey-R*.ufo
psfsetkeys -p backup=0 -i ../tools/archive/lib.csv --plist lib Bailey-B*.ufo
psfsetkeys -p backup=0 -i ../tools/archive/lib.csv --plist lib Bailey-R*.ufo
psfsetkeys -p backup=0 -k openTypeNameDesigner -v "hussain.rachana@gmail.com http://smc.org.in" Bailey-B*.ufo
psfsetkeys -p backup=0 -k openTypeNameDesigner -v "hussain.rachana@gmail.com http://smc.org.in" Bailey-R*.ufo
psfsetkeys -p backup=0 -k openTypeNameLicenseURL -v http://scripts.sil.org/OFL Bailey-B*.ufo
psfsetkeys -p backup=0 -k openTypeNameLicenseURL -v http://scripts.sil.org/OFL Bailey-R*.ufo
psfsetkeys -p backup=0 -k openTypeNameManufacturer -v "Hussain KH, Rajeesh K Nambiar, Santhosh Thottingal, Swathanthra Malayalam Computing" Bailey-B*.ufo
psfsetkeys -p backup=0 -k openTypeNameManufacturer -v "Hussain KH, Rajeesh K Nambiar, Santhosh Thottingal, Swathanthra Malayalam Computing" Bailey-R*.ufo
psfsetkeys -p backup=0 -k "com.schriftgestaltung.weight" -v "Bold" --plist lib Bailey-B*.ufo
psfsetkeys -p backup=0 -k "com.schriftgestaltung.weightValue" -v "700" --plist lib Bailey-B*.ufo
psfsetkeys -p backup=0 -k "com.schriftgestaltung.weightValue" -v "400" --plist lib Bailey-R*.ufo
