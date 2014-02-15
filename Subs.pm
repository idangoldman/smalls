#!/usesr/bin/perl
use strict;
use 5.14.0;
use warnings;
use Data::Dumper;

package Smalls::Subs;

sub show {
  my @items = @_;
  foreach my $item (@items) {
    my $ip = $item->{'ip'};
    my $domains = join ' ', @{ $item->{'list'} };

    say "$ip $domains";
  }
}

sub add {
  my ($list, $ip, $domain, $group) = @_;
  
  # kosher?
  foreach my $item (keys $list, $ip, $domain) {
    defined $item or die "Must provide actions\n";
  }

  # is this right?
  $group = '' unless defined $group;
  
  # is this?
  push(@{$list}, {'ip' => $ip, 'list' => [$domain]});
}

# why?
1;