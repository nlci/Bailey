#!/usr/bin/python3
# this is a smith configuration file

# set meta-information
APPNAME='Bailey'
FAMILY = APPNAME
COPYRIGHT='Copyright (c) 2019-2020, NLCI (http://www.nlci.in/fonts/)'
DESC_SHORT='Modified Malayalam font heavily based on Rachana'

VERSION='0.100'
# BUILDLABEL = "alpha1"

# Set up the FTML tests
ftmlTest('tools/ftml-smith.xsl')

styles = ('Regular', 'Bold')

for s in styles:
    font(target = process(FAMILY + '-' + s + '.ttf',
            name(FAMILY, lang='en-US', subfamily=(s))
            ),
        source = 'build/Rachana-' + s + '.ttf',
        opentype = internal(),
        version = VERSION,
        copyright = COPYRIGHT,
        license = ofl('Bailey', 'NLCI'),
        script = ['mlm2', 'mlym'],
        pdf = fret(params = '-oi')
    )
