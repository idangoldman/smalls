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
  my (@list, $domain, $ip, $group) = @_;
  
  # is this right?
  $group = '' unless defined $group;

  push(@list, [{
    'ip' => $ip,
    'list' => $domain 
  }]);

  show(@list);

  say $domain;
  say $ip;
  say $group;
}

# why?
1;