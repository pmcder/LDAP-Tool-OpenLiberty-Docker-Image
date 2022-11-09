## Overview

* This project is an LDAP query application deployed to Open Liberty.

* At this time the query tool supports searching an ldap directory. 

* The repo for the application itself is at [https://github.com/pmcder/LDAP-Tool/](LDAP-Tool)

## building and running

docker build -t ldap-tool . 

docker run -d --name ldap-tool-container -p 8080:8080 ldap-tool

## Using the application

Navigate to localhost:8080/search 

If connecting to an LDAP server running on your local machine use the following as the host so that the application can connect to localhost from inside the container:
`host.docker.internal`

