command Picklast g/\v(^pick)(\_.*^pick)@=/d
command Fixup 2,$s/pick/f/g
command Squash 2,$s/pick/s/g
