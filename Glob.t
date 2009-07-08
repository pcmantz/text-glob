#!/usr/bin/env perl
# Glob.t
# written by Paul Mantz <pcmantz@zmanda.com>
# created 03 Jul 2009
# Version v0.01
# Copyright (C) 2009, Paul Mantz

##############################################################################
# Libraries
##############################################################################

use strict;
use warnings;

use lib "./lib";
use Test::More tests => 12;



##############################################################################
# Begin Block
##############################################################################

BEGIN {
    use_ok("Text::Glob");
}

##############################################################################
# Tests
##############################################################################

# Testing basics
is( Text::Glob::glob2regex("//"), qr{/} );
is( Text::Glob::glob2regex("*"),  qr{[^/]*} );
is( Text::Glob::glob2regex("**"), qr{.*} );
is( Text::Glob::glob2regex("?"),  qr{.} );
is( Text::Glob::glob2regex("."),  qr{\.} );

# Simple text
is( Text::Glob::glob2regex("bonertown"),      qr{bonertown} );
is( Text::Glob::glob2regex("chappaqua"),      qr{chappaqua} );
is( Text::Glob::glob2regex("Long Beach, CA"), qr{Long Beach, CA} );
is( Text::Glob::glob2regex("The quick brown fox jumped over the lazy dog"),
    qr{The quick brown fox jumped over the lazy dog} );

# Slightly more complicated examples
is( Text::Glob::glob2regex("\?"), qr{.} );


is( Text::Glob::glob2regex("*.*"), qr{[^/]*\.[^/]*} );
