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
  my @list = Smalls::Gens::list($file);

  defined $cmd or die "Must provide command\n";

  if ($cmd eq 'show') {
    Smalls::Subs::show(@list);
  } elsif ($cmd eq 'add') {
    Smalls::Subs::add(\$file, \@list, @details);
  } else {
    say 'command?';
  }
}

main($hosts_file, @ARGV);

__END__