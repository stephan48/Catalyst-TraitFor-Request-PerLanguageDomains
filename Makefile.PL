use strict;
use warnings;
use inc::Module::Install;

BEGIN {
    if ($Module::Install::AUTHOR) {
        require Module::Install::AuthorTests;
        require Module::Install::AuthorRequires;
    }
}

license 'perl';

name 'Catalyst-TraitFor-Request-PerLanguageDomains';
all_from 'lib/Catalyst/TraitFor/Request/PerLanguageDomains.pm';

requires 'Catalyst' => '5.80';
requires 'Moose';
requires 'I18N::AcceptLanguage';
requires 'namespace::autoclean';

test_requires 'Test::More';
test_requires 'Catalyst::Action::RenderView';
test_requires 'Catalyst::Plugin::Session';
test_requires 'Catalyst::Plugin::Session::State::Cookie';
test_requires 'Catalyst::Plugin::Session::Store::File';
test_requires 'CatalystX::RoleApplicator';
test_requires 'HTTP::Request::Common';

author_requires 'Test::EOL' => '0.3';
author_requires 'Test::NoTabs';
author_requires 'Test::Pod' => '1.14';
author_requires 'Test::Pod::Coverage' => '1.08';

resources repository => 'http://github.com/stephan48/Catalyst-TraitFor-Request-PerLanguageDomains/';

tests 't/*.t';
author_tests 't/author';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/Catalyst/TraitFor/Request/PerLanguageDomains.pm > README") and die $!;
}
auto_install;
WriteAll;

