package Sorter;
use strict;
use warnings;

use parent 'Class::Accessor::Fast';

__PACKAGE__->mk_accessors(qw/tmp/);

sub new {
	my ($class, %args) = shift @_;
	return $class->SUPER::new(%args);
}

sub sort {
	use Data::Dumper;
	my $self = shift;
	my @tmp = @{$self->{tmp}};
	my $count = @tmp;
	if($count==1){
		push(@{$self->{sorted}},$tmp[0]);
	} else {
		my @left;
		my @right;
		
		for my $number(@tmp){
			if($number < @tmp[$count/2]){
				push(@left,$number);			
			} else {
				push(@right,$number);
			}
		}
		if(!@left){
			splice(@right,$count/2,1);
			push(@left,@tmp[$count/2]);
		}

		$self->{left} = Sorter->new;
		$self->{right} = Sorter->new;
		$self->{left}->set_values(@left);
		$self->{right}->set_values(@right);
		$self->{left}->sort;
		$self->{right}->sort;
		push(@{$self->{sorted}},@{$self->{left}->{sorted}});
		push(@{$self->{sorted}},@{$self->{right}->{sorted}});
	}
}

sub set_values {
	my $self = shift;
	$self->{tmp} = \@_;
}

sub get_values {
	my $self = shift;
	return @{$self->{sorted}};
}

1;
