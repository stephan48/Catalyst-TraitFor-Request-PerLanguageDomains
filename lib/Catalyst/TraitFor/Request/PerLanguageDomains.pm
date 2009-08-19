package Catalyst::TraitFor::Request::PerLanguageDomains;
use Moose::Role;
use I18N::AcceptLanguage;
use namespace::autoclean;

requires qw/
    uri
    _context
    headers
/;

sub language {
	my $self = shift;
	my $host = $self->uri->host;

	if ($host =~ m{^(\w{2})\.}) {
		return $1;
	}

	my $session = $self->_context->session->{'language'};
	if ($session) {
		return $session;
	}

	my $header = $self->headers->header('Accept-language');
	if ($header) {
		return $header;
	}

	return;
}

1;

=pod

=head1 NAME

Catalyst::TraitFor::Request::PerLanguageDomains - Language detection for Catalyst::Requests

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    package MyApp;

    use Moose;
    use namespace::autoclean;

    use Catalyst;
    use CatalystX::RoleApplicator;

    extends 'Catalyst';

    __PACKAGE__->apply_request_class_roles(qw/
        Catalyst::TraitFor::Request::PerLanguageDomains
    /);

    __PACKAGE__->setup;

=head1 DESCRIPTION

Extend request objects with a method for language detection

=head1 METHODS

=head2 language

    my $language = $ctx->request->language;

Returns a string that is either the lang part of the domain(f.e. de from de.example.org) or the language set in the Session or the Accept-Language header.

=head1 AUTHOR

  Stephan Jauernick <stephan@stejau.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Stephan Jauernick.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

