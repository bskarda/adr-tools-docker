# Build stage
FROM alpine:3.7

# Grab the bleeding edge adr tools
# Instructions from https://github.com/npryce/adr-tools/blob/master/INSTALL.md#from-git
RUN apk --no-cache add git && \
    mkdir /adr && \
    cd /adr && \
    git clone https://github.com/npryce/adr-tools.git

# Release stage
FROM alpine:3.7
# Just dump the contents of src into PATH
COPY --from=0 /adr/adr-tools/src/. /usr/local/bin/

# ADR tools needs bash
RUN apk --no-cache add bash

# TODO worth adding an entrypoint?
# TODO autocomplete from outside the container?
