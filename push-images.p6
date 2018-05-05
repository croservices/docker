sub MAIN($version where /^\d+'.'\d+'.'\d+$/) {
    my constant @repos = 'cro-core', 'cro-http', 'cro-http-websocket', 'cro', 'cro-zeromq';

    for @repos {
        if slurp("$_/Dockerfile") !~~ /'cro_version=' $version/ {
            note "Wrong or missing version in $_/Dockerfile";
            exit 1;
        }
    }

    for @repos {
        my $tag = "croservices/{$_}:$version";
        shell "cd $_ && docker build -t $tag . && docker push $tag";
    }
}
