#!/bin/bash

#ENDPOINT="https://lrs.adlnet.gov/xapi/statements"
ENDPOINT="http://10.100.34.7/xapi/statements"

# Have bash encode the credentials to base64
USER="test"
PASS="test"
AUTH=$(echo -n "$USER:$PASS" | base64)
#echo -e $AUTH

# Already encoded AUTH 
#AUTH="YWRtaW46YWRtaW4="


STMT='{
    "actor": {
        "mbox": "mailto:test@test.com",
        "name": "Test",
        "objectType": "Agent"
    },
    "verb": {
        "id": "http://adlnet.gov/expapi/verbs/passed",
        "display": {
            "en-US": "passed"
        }
    },
    "object": {
        "id": "http://adlnet.gov/expapi/activities/example",
        "definition": {
            "name": {
                "en-US": "Example Activity"
            },
            "description": {
                "en-US": "Example activity description"
            }
        },
        "objectType": "Activity"
    }
}'
 
curl -i -X POST -H "X-Experience-API-Version: 1.0.1" -H "Authorization: Basic $AUTH" --data-binary "$STMT" $ENDPOINT
