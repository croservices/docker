sub MAIN($version where /^\d+'.'\d+'.'\d+$/) {
    my constant @repos = 'cro-core', 'cro-http', 'cro-http-websocket', 'cro', 'cro-zeromq';
    for @repos {
        my $df = slurp "$_/Dockerfile";
        if $df ~~ s/'ARG cro_version=' <( \S+/$version/ {
            spurt "$_/Dockerfile", $df;
        }
        else {
            die "Could not find version to bump in $_/Dockerfile";
        }
    }
    shell "git commit -m 'Bump images to Cro $version' . && git push origin master"
}
