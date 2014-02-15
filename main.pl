#!/usesr/bin/perl
use strict;
use 5.14.0;
use warnings;
use Data::Dumper;

# i guess it is not the legit way to do it.
use lib '.';
use Gens;
use Subs;

my $hosts_file = '/etc/hosts';

sub main {
  # is @details a normal way to say "all the rest of the variables gonna be a list"?
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