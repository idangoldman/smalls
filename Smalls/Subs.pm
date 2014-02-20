package Smalls::Subs;
use strict;
use warnings;
use 5.14.0;

use parent 'Exporter';
our @EXPORT_OK = qw<show add>;

use Data::Dumper;

sub show {
  my @listItems = @_;
  foreach my $item (@listItems) {
    my $ip = $item->{'ip'};
    my $domains = join ' ', @{ $item->{'list'} };

    say "$ip $domains";
  }
}

sub add {
  my ($file, $list, $ip, $domain, $group) = @_;

  # kosher?
  foreach my $item (keys $list, $ip, $domain) {
    defined $item or die "Must provide actions\n";
  }

  $group //= 'misc';
  
  # is this?
  push(@{$list}, {'ip' => $ip, 'list' => [$domain]});

  show(@{$list});
}

1;
