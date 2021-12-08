#!/usr/bin/python3

from fontParts.world import *
import sys

# Open UFO
ufo = sys.argv[1]
font = OpenFont(ufo)

# Modify UFO
one = font['.null']
one.unicode = None

for glyph in font:
    for contour in glyph.contours:
        # Reverse contour direction since the glyphs came from
        # a TTF font and the source should have PostScript curves
        contour.reverse()

        # Remove stray contours
        if len(contour) <= 1:
            glyph.removeContour(contour)

# Save UFO
font.changed()
font.save()
font.close()
