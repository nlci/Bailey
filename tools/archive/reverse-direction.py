#!/usr/bin/python3

from fontParts.world import *
import sys

# Open UFO
ufo = sys.argv[1]
font = OpenFont(ufo)

# Modify UFO
for glyph in font:
    # Reverse contour direction since the glyphs came from
    # a TTF font and the source should have PostScript curves
    for contour in glyph.contours:
        contour.reverse()

# Save UFO
font.changed()
font.save()
font.close()
