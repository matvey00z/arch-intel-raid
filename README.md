# Intel fake RAID support for archlinux

This is a pacman hook for patching udev rules before creating initramfs

## Problem

- RAID admin utility `mdadm` requires env `IMSM_NO_PLATFORM=1` to be set to
assemble Intel fake RAIDs
- The assembly rules are specified in udev rules
- Udev rules are overwritten every time udev is updated

## Solution

Patch udev rules every time pacman updates udev

## Install

Put `89-mkinitcpio-preinstall.{sh,hook}` under `/etc/pacman.d/hooks/`.
That's it, the next time you update udev/mdadm the rules will be patched.

## References
https://bbs.archlinux.org/viewtopic.php?id=202597

https://askubuntu.com/questions/1239082/reassemble-intel-rst-raid-on-another-mainboard

From `man mdadm`:

```
       IMSM_NO_PLATFORM
              A key value of IMSM metadata is that it allows  interoperability
              with  boot ROMs on Intel platforms, and with other major operat-
              ing systems.  Consequently, mdadm will only allow an IMSM  array
              to  be  created  or modified if detects that it is running on an
              Intel platform which supports IMSM, and supports the  particular
              configuration  of IMSM that is being requested (some functional-
              ity requires newer OROM support).

              These checks can be suppressed by setting IMSM_NO_PLATFORM=1  in
              the environment.  This can be useful for testing or for disaster
              recovery.  You should be aware that interoperability may be com-
              promised by setting this value.
```
