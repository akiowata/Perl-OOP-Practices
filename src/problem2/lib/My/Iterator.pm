package My::Iterator;
use strict;
use warnings;

use Data::Dumper;

sub new{
	my ($class, $list) = @_;
	my $self = {
		cur  => \$list,
		next => $list->{next},
	};
	return bless $self, $class;
}

sub has_next{
	my $self = shift;
	return $self->{next};
}

sub next{
	my $self = shift;
	$self->{cur} = $self->{next};
	$self->{next} = ${$self->{next}}->{next};
	return $self;
}

sub value{
	my $self = shift;
	return ${$self->{cur}}->{value};
}

1;
