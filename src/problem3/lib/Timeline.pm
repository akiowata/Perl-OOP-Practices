package Timeline;

use strict;
use warnings;

sub new {
	my ($class, %args) = @_;
	return bless {%args}, $class;
}

sub message {
	my $self = shift;
	my $timeline = $self->{friend}.":".$self->{message};
	return $timeline;
}

1;
