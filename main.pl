#!/usesr/bin/perl
use v5.14;
use strict;
use warnings;

use Data::Dumper;

use Smalls::Gens;
use Smalls::Subs;

my $hosts_file = '/etc/hosts';

sub main {
  my ($file, $cmd, @details) = @_;

  defined $cmd or die "Must provide command\n";

  my @list = Smalls::Gens::list($file);

  if ($cmd eq 'show') {
    Smalls::Subs::show(@list);
  } elsif ($cmd eq 'add') {
    @list = Smalls::Subs::add($file, \@list, @details);

    # this code haven't been checked
    Smalls::Gens::add($file, \@list);
  } else {
    say 'command?';
  }
}

main($hosts_file, @ARGV);

__END__