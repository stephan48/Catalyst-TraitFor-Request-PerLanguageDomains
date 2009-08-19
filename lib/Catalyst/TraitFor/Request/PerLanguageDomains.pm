package Catalyst::TraitFor::Request::PerLanguageDomains;
use Moose::Role;
use I18N::AcceptLanguage;
use namespace::autoclean;

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

