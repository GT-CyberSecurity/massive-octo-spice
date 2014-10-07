package CIF::Message::Token;

use strict;
use warnings;

use Mouse;

has [qw/Token Alias Description Created Expires/] => (
    is  => 'rw',
);

has [qw/restricted revoked admin/] => (
    is  => 'ro',
);

sub understands {
    my $self = shift;
    my $args = shift;

    return unless($args->{'rtype'});
    return 1 if($args->{'rtype'} =~ /^token-/);
}

sub TO_JSON {
    my $self = shift;

    return {
        'restricted'    => $self->restricted,
        'revoked'       => $self->revoked,
        'admin'         => $self->admin,
        
        'Token'         => $self->Token,
        'Alias'         => $self->Alias,
        'Description'   => $self->Description,
        'Created'       => $self->Created,
        'Expires'       => $self->Expires,        
    };
}

__PACKAGE__->meta()->make_immutable();

1;