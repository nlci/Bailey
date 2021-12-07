#!/usr/bin/python3

from fontParts.world import *
import sys

# Open UFO
ufo = sys.argv[1]
font = OpenFont(ufo)

# Modify UFO

for glyph in font:
    glyph_name = glyph.name
    if glyph_name.startswith('gc'):
        for contour in glyph.contours:
            # Remove base glyph, leaving the diacritic we need later
            if len(contour) > 8:
                glyph.removeContour(contour)
            if len(contour) in (3, 5):
                glyph.removeContour(contour)

# Save UFO
font.changed()
font.save()
font.close()
