package Bird;

use strict;
use warnings;
use Timeline;

sub new {
	my ($class, %args) = @_;
	return bless {%args}, $class;
}

sub follow {
	my ($self, $friend) = @_;
	if(!$self->{friend_list}){
		my @friend_list;
		$self->{friend_list} = \@friend_list;
	}
	push(@{$self->{friend_list}}, \$friend);
}

sub tweet {
	my ($self, $message) = @_;
	if(!$self->{message_list}){
		my @message_list;
		$self->{message_list} = \@message_list;
	}
	push(@{$self->{message_list}}, $message); 
}

sub friends_timeline {
	my $self = shift;
	my @timelines;
	foreach my $friend (@{$self->{friend_list}}) {
		foreach my $message (@{$$friend->{message_list}}){
			my $timeline = Timeline->new(friend => $$friend->{name}, message => $message);
			unshift(@timelines, $timeline);
		}
	}
	return \@timelines;
}

1;
