#!/usesr/bin/perl
use strict;
use 5.14.0;
use warnings;
use Data::Dumper;

package Smalls::Gens;

# sub add {
#   my ($hosts_file, $data) = @_;

#   sudo open my $file, '>', $hosts_file
#     or die "Can't open $hosts_file: $!\n";

#   print <$file>, $data
#     or die "Can't write to $file: $!\n";

#   close $file
#     or die "Can't close $hosts_file: $!\n";
# }

sub list {
  my ($hosts_file) = @_;

  open my $file, '<', $hosts_file
    or die "Can't open $hosts_file: $!\n";

  chomp( my @lines = <$file> );

  close $file
    or die "Can't close $hosts_file: $!\n";

  my @list = ();
  my $group  = 'misc';

  foreach my $line (@lines) {
    my @data    = split /\s+/, $line;
    my %details = ();

    defined $data[0] or next;

    if ($data[0] =~ /\d/) {
      $details{'ip'} = $data[0];

      shift @data;

      $details{'list'} = \@data;

      push @list, \%details;
    }
  }

  return @list;
}

1;