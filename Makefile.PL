use strict;
use warnings;
use inc::Module::Install;

name 'Catalyst-TraitFor-Request-PerLanguageDomains';
all_from 'lib/Catalyst/TraitFor/Request/PerLanguageDomains.pm';

requires 'Catalyst' => '5.80';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/Catalyst/TraitFor/Request/PerLanguageDomains.pm > README") and die $!;
}
WriteAll;

