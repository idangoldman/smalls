package Smalls::Subs;
use v5.14;
use strict;
use warnings;

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

  # what is the policy about 'return' in perl?
  $list
}

1;