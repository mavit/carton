use strict;
use Test::More;
use xt::CLI;

{
    my $app = cli();

    $app->dir->child("cpanfile")->spew(<<EOF);
on test => sub {
    requires 'Test::NoWarnings';
};
EOF

    $app->run("install");

    $app->run("list");
    like $app->stdout, qr/Test-NoWarnings/;
}

done_testing;



