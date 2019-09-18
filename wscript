#!/usr/bin/python
# this is a smith configuration file

# set the default output folders
out='results'

# locations of files needed for some tasks
STANDARDS='tests/reference'

# set meta-information
APPNAME='Bailey'

DESC_SHORT='Modified Malayalam font heavily based on Rachana'

FAMILY = 'Rachana'
styles = ('Regular', 'Bold')

for s in styles:
    font(target = FAMILY + '-' + s + '.ttf',
        source = 'build/' + FAMILY + '-' + s + '.ttf',
        opentype = internal(),
        script = ['mlm2', 'mlym'],
        fret = fret(params = '-r -oi')
    )
