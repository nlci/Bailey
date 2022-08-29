#!/usr/bin/python3
# this is a smith configuration file

# set meta-information
APPNAME='Bailey'
FAMILY = APPNAME

# Get version and authorship info from Regular UFO
# must be first function call:
getufoinfo('source/' + FAMILY  + '-Regular.ufo')

# Set up the FTML tests
ftmlTest('tools/ftml-smith.xsl')

designspace('source/' + FAMILY + '.designspace',
    target = process('${DS:FILENAME_BASE}.ttf'),
    #     cmd('psfchangettfglyphnames ${SRC} ${DEP} ${TGT}', ['${DS:FILE}'])
    # ),
    opentype = fea('features/Rachana-${DS:STYLENAME}.fea',
        mapfile = 'generated/' + '${DS:FILENAME_BASE}.map',
        no_make = 1,
        ),
    version = VERSION,
    woff = woff('web/${DS:FILENAME_BASE}', type='woff2',
        metadata = f'../source/{FAMILY}-WOFF-metadata.xml'),
    script = ['mlm2', 'mlym'],
    pdf = fret(params='-oi')
    )
