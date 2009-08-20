package TestApp;
use Moose;
use CatalystX::RoleApplicator;
use namespace::autoclean;

use Catalyst qw/
    Session
    Session::Store::File
    Session::State::Cookie
/;
extends 'Catalyst';

__PACKAGE__->config(
    'TraitFor::Request::PerLanguageDomains' => {
        default_language => 'de',
        selectable_language => ['de','en'],
    }
);

__PACKAGE__->apply_request_class_roles(qw/Catalyst::TraitFor::Request::PerLanguageDomains/);

__PACKAGE__->setup;

__PACKAGE__->meta->make_immutable( replace_constructor => 1 );

