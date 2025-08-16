So I had this patched for myself and it stays in the "works on my machine" for quite a long time until people randomly prompts me that they are in question of how to do it. Here I'm rewriting a more informative README so hopefully that helps. [It all starts here](https://bbs.archlinux.org/viewtopic.php?pid=2184168#p2184168). This repository is the source of the AUR package build utilizing DKMS, so **simply running `make` is expected to be NOT WORKING.** Feel free to open issues if you want to share your process doing it on your distros, or met some issues with the process, but be specific. Obviously I'm not affiliated with HP so no customer services guarantees are provided from my side. Providing everything as is here and you use them at your own risk.

# HP Elite Dragonfly G4 Linux Audio Patch (DKMS)

This repository hosts source for [DKMS](https://wiki.archlinux.org/title/Dynamic_Kernel_Module_Support) package in AUR to apply a kernel patch that resolve the broken sound of the **HP Dragonfly G4**.

> **Upstreaming WIP**: [LKML Email Thread](https://lore.kernel.org/linux-sound/20241122044435.28061-1-me@nicho1as.wang/T/#u)
>
> ‼️ Linux version currently targeting: `v6.17-rc1` as 6.15 and 6.16 had bugs unrelated to this fix that causes left channels to not work properly so I bumped it to work with `linux-mainline` on Arch Linux.

## Howto

### Arch Linux or other Arch-flavored distros
All you need is to build and install this package [snd-hda-scodec-cs35l41-sandwalker-dkms-git](https://aur.archlinux.org/packages/snd-hda-scodec-cs35l41-sandwalker-dkms-git). All general DKMS requirements applies, install `dkms` and `*-header` for your kernel flavor, etc.


### Other Distros:

Prereq in general: you would need to install DKMS, kernel headers, and basic build tools.


#### Patch kernel driver
So the module you want to patch is `snd-hda-scodec-cs35l41` and you will need to retrieve the source of it from either your distro's source tree or vanilla Linux on [kernel.org](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git). Identify your kernel version with `uname -r`. Typically you want to use source from matching minor version: say you have `x.yy.zzz-abcde` on your machine, retrieve the source from a `x.yy.*` kernel source.

- For versions prior to `6.17`: Sources you're interested in is located at `/sound/pci/hda` of your kernel source tree.
- For `6.17` things are moved into `/sound/hda/codecs/side-codecs`. You will also need some headers from `/sound/hda/codecs/`.

All in all, just do whatever you need so that you can build `snd-hda-scodec-cs35l41` for the kernel you're running.
Now, apply the `sandwalker.patch` against `cs35l41_hda_property.c`:

```bash
patch cs35l41_hda_property.c sandwalker.patch
```

#### Build and Install

Then it's straightforward, build and install the kernel module in the way you like. In my case I renamed the module and black listed the in-tree version by putting `blacklist.conf` in `/etc/modprobe.d/`, but I never verified if this step is a must.
