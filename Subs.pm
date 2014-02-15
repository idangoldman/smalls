#!/usesr/bin/perl
use strict;
use 5.14.0;
use warnings;
use Data::Dumper;

package Smalls::Subs;

my @listItems = ();

sub show {
  @listItems = @_;
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

  # is this right?
  $group = 'misc' unless defined $group;
  
  # is this?
  push(@{$list}, {'ip' => $ip, 'list' => [$domain]});

  # this code haven't been checked
  # Smalls::Gens::add($file, $list);
  # @listItems = @{$list};
}

# why?
1;