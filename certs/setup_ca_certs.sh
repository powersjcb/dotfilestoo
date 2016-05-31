#!/usr/bin bash

# untrust all the untrustworthy certs

security add-trusted-cert -d -r deny -k "/Library/Keychains/System.keychain" ./untrustworthy/blue_coat_mitm.crt
