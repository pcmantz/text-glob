package Text::Glob;

##############################################################################

use strict;
use warnings;

use Carp;

my $dirsep    = "/";
my $rootdir   = "/";
my $currdir   = ".";
my $parentdir = "..";

BEGIN {

}

sub match
{
    my $glob = shift @_;
    my @strings = ( @_ || return );

    my $regex = glob2regex($glob);

    my @matches;
    map { push @matches, $_ if ( $_ =~ $regex ) } @strings;
    return @matches;
}

sub glob2regex
{
    my $glob = shift @_;

    # escape characters with special regex meaning
    # $glob = s{}{}g;

    $glob =~ s{//+}{/}g;
    $glob =~ s{\*\*+}{.*}g;
    $glob =~ s{\*}{\[^$dirsep\]*}g;
    $glob =~ s{\?}{.}g;

    return qr/$glob/;
}

sub glob2regexstr {




}


1;
__END__

=head1 NAME

Text::Glob - Perform match operations using glob syntax

=head1 SYNOPSIS

    use Glob;

    my

    if ( Text::Glob::match($pattern, $file) ) {
        # perform some action
    }

    my @fileList = ("something.txt", "");

    foreach my $file ( Text::Glob::match($pattern, @fileList) ) {
       # whatever you'd like
    }


=head1 DESCRIPTION

Stub documentation for Glob,

Blah blah blah.

=head2 EXPORT

None by default.

=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Paul C Mantz, E<lt>pcmantz@centralcityE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Paul C Mantz

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 BUGS

None reported... yet.

=cut
