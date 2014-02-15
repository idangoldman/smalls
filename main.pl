#!/usesr/bin/perl
use strict;
use 5.14.0;
use warnings;
use Data::Dumper;

use lib '.';
use Gens;
use Subs;

my $hosts_file = '/etc/hosts';

sub main {
  my ($file, $cmd, @details) = @_;
  my @list = Smalls::Gens::list($file);

  defined $cmd or die "Must provide command\n";

  if ($cmd eq 'show') {
    Smalls::Subs::show(@list);
  } elsif ($cmd eq 'add') {
    Smalls::Subs::add(\@list, @details);
  } else {
    say 'command?';
  }
}

main($hosts_file, @ARGV);

__END__