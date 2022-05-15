#/bin/bash

sed -i -E \
    's$"(/usr/bin/mdadm|/sbin/mdadm)$"/usr/bin/env IMSM_NO_PLATFORM=1; \1$g' \
    /usr/lib/udev/rules.d/64-md-raid-assembly.rules
