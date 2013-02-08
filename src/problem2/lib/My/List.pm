package My::List;
use strict;
use warnings;

use My::Iterator;

sub new {
	my $class = shift;
	return bless {
		next  => undef,
		value => undef,
	}, $class;
}

sub append {
	my ($self,$value) = @_;
	if(!$self->{next}){
		my $next = My::List->new;
		$next->{value} = $value;
		$self->{next} = \$next;
	} else {
		${$self->{next}}->append($value);
	}
}

sub iterator {
	my $self = shift;
	my $iterator = My::Iterator->new($self);
	return $iterator;
}

1;
