# Cro Dockerfiles

These `Dockerfile`s define images that may be used when deploying services built with [Cro](http://cro.services/). They are based on the Debian `bullseye-slim` image, with build of Rakudo with only Cro's dependencies installed.

Until Cro version 0.8.7, images were built based on a Rakudo Star image, and hence shipped with many more modules. Beware that if you are upgrading from the Rakudo Star based images, you may well need to change your own `Dockerfile`s to install modules that Star bundled, but are no longer in these images.
