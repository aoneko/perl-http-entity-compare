package HTTP::Entity::Compare;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

sub strong_compare {
    my ($class, $entity, $header) = @_;

    my $parsed_entity = $class->_parse($entity)->[0];
    my $parsed_header = $class->_parse($header);

    my $is_match = 0;
    for (@$parsed_header) {
        $is_match = 1 if ( $class->_strong_match($parsed_entity, $_) );
    }
    return $is_match;
}

sub weak_compare {
    my ($class, $entity, $header) = @_;

    my $parsed_entity = $class->_parse($entity)->[0];
    my $parsed_header = $class->_parse($header);

    my $is_match = 0;
    for (@$parsed_header) {
        $is_match = 1 if ( $class->_weak_match($parsed_entity, $_) );
    }
    return $is_match;
}

sub _parse {
    my ($class, $header) = @_;

    my @splited = split /,\s+/, $header;

    my $ret = [];
    for (@splited) {
        my $weak;
        $_ =~ s/"//g;
        $weak = 1 if ($_ =~ s/W\///);
        push (@$ret, {
            'opaque-tag' => $_,
            ($weak) ? (weak => 1) : (),
        });
    }
    return $ret;
}

sub _weak_match {
    my ($class, $entity1, $entity2) = @_;
    return ($entity1->{'opaque-tag'} eq $entity2->{'opaque-tag'}) ? 1 : 0;
}

sub _strong_match {
    my ($class, $entity1, $entity2) = @_;

    return (
        ($entity1->{'opaque-tag'} eq $entity2->{'opaque-tag'})
        && !$entity1->{'weak'} && !$entity2->{'weak'}
    ) ? 1 : 0;
}



1;
__END__

=encoding utf-8

=head1 NAME

HTTP::Entity::Compare - It's new $module

=head1 SYNOPSIS

    use HTTP::Entity::Compare;

=head1 DESCRIPTION

HTTP::Entity::Compare is ...

=head1 LICENSE

Copyright (C) aoneko.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

aoneko E<lt>aoneko@cpan.orgE<gt>

=cut

