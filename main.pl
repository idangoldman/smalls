#!/usesr/bin/perl
use strict;
use warnings;
use v5.14;
use Data::Dumper;

use Smalls::Gens;
use Smalls::Subs qw<show add>;

my $hosts_file = '/etc/hosts';

sub main {
  my ($file, $cmd, @details) = @_;
  my @list = Smalls::Gens::list($file);

  defined $cmd or die "Must provide command\n";

  if ($cmd eq 'show') {
    show(@list);
  } elsif ($cmd eq 'add') {
    add($file, \@list, @details);
  } else {
    say 'command?';
  }
}

main($hosts_file, @ARGV);

__END__

