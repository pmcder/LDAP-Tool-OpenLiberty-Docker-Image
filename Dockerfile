
FROM icr.io/appcafe/open-liberty:full-java11-openj9-ubi as staging

COPY --chown=1001:0 ldap-tool.jar \
                    /staging/ldap-tool.jar

RUN springBootUtility thin \
 --sourceAppPath=/staging/ldap-tool.jar \
 --targetThinAppPath=/staging/thin-ldap-tool.jar \
 --targetLibCachePath=/staging/lib.index.cache

# Build the image
FROM icr.io/appcafe/open-liberty:full-java11-openj9-ubi

ARG VERSION=1.0
ARG REVISION=SNAPSHOT

COPY --chown=1001:0 server.xml /config/server.xml

COPY --chown=1001:0 --from=staging /staging/lib.index.cache /lib.index.cache
COPY --chown=1001:0 --from=staging /staging/thin-ldap-tool.jar \
                    /config/dropins/spring/thin-ldap-tool.jar

RUN configure.sh

