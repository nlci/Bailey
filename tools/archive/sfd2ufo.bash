#!/bin/bash

ar=../tools/archive
rm -rf Bailey-*.ufo
for sfd in *.sfd
do
    echo $sfd
    fontfilename="$(basename $sfd .sfd)"
    fontforge -script $ar/sfd2ufo.ff $sfd ${fontfilename}.ufo3
    mv -v ${fontfilename}.ufo3 ${fontfilename}.ufo

    # Set WOFF metadata in UFOs
    # Also works around https://github.com/fontforge/fontforge/issues/4951
    fontinfo=${fontfilename}.ufo/fontinfo.plist
    head -n -3 ${fontinfo} > tmp.plist
    mv tmp.plist ${fontinfo}
    cat ${ar}/fontinfo.plist >> ${fontinfo}
done
mv -v Rachana-B*.ufo Bailey-Bold.ufo
mv -v Rachana-R*.ufo Bailey-Regular.ufo
for ufo in *.ufo
do
    psfnormalize -p backup=0 -v 3 -p checkfix=none $ufo
    psfsetkeys -p backup=0 -k familyName -v Bailey $ufo
    psfsetkeys -p backup=0 -k openTypeNamePreferredFamilyName -v Bailey $ufo
    psfsetkeys -p backup=0 -k styleMapFamilyName -v "Bailey" $ufo
    psfsetkeys -p backup=0 -i $ar/lib.csv --plist lib $ufo
    psfsetkeys -p backup=0 -k openTypeNameDesignerURL -v "hussain.rachana@gmail.com http://smc.org.in" $ufo
    psfsetkeys -p backup=0 -k openTypeNameLicenseURL -v http://scripts.sil.org/OFL $ufo
    psfsetkeys -p backup=0 -k openTypeNameManufacturer -v "Swathanthra Malayalam Computing" $ufo
    psfsetkeys -p backup=0 -k openTypeOS2VendorID -v "NLCI" $ufo
    psfsetkeys -p backup=0 -k openTypeNameDescription -v "Modified Malayalam font heavily based on Rachana" $ufo
    psfsetkeys -p backup=0 -k "copyright" --filepart ../OFL.txt $ufo
    psfsetkeys -p backup=0 -k "openTypeNameLicense" --file ../OFL.txt $ufo
done
psfsetkeys -p backup=0 -k openTypeNameDesigner -v "Hussain KH, Rajeesh K Nambiar, Santhosh Thottingal" Bailey-B*.ufo
psfsetkeys -p backup=0 -k openTypeNameDesigner -v "Chitrajakumar R, Hussain KH, Gangadharan N, Vijayakumaran Nair, Subash Kuraiakose" Bailey-R*.ufo
psfsetkeys -p backup=0 -k postscriptFontName -v "Bailey-Bold" Bailey-B*.ufo
psfsetkeys -p backup=0 -k postscriptFontName -v "Bailey-Regular" Bailey-R*.ufo
psfsetkeys -p backup=0 -k postscriptFullName -v "Bailey Bold" Bailey-B*.ufo
psfsetkeys -p backup=0 -k postscriptFullName -v "Bailey Regular" Bailey-R*.ufo
psfsetkeys -p backup=0 -k "com.schriftgestaltung.weight" -v "Bold" --plist lib Bailey-B*.ufo
psfsetkeys -p backup=0 -k "com.schriftgestaltung.weightValue" -v "700" --plist lib Bailey-B*.ufo
psfsetkeys -p backup=0 -k "com.schriftgestaltung.weightValue" -v "400" --plist lib Bailey-R*.ufo
