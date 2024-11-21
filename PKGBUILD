# Maintainer: Nicholas Wang <me at nicho1as dot wang>

_pkgbase=snd-hda-scodec-cs35l41-sandwalker-git
pkgname=${_pkgbase}-dkms
pkgver=r1.dfaa7ba
pkgrel=1
pkgdesc="Patched cs35l41 HDA driver for HP Sandwalker"
url="https://github.com/nicholascw/aur-snd-hda-scodec-cs35l41-sandwalker"
arch=('any')
license=('GPL2')
depends=('dkms')
source=("${pkgname}::git+https://github.com/nicholascw/aur-snd-hda-scodec-cs35l41-sandwalker.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
  cd "$srcdir/${pkgname}"
  local install_dir="${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}"/dkms.conf

  install -Dm644 dkms.conf "${install_dir}/"
  install -Dm644 Makefile "${install_dir}/"

  for i in $(ls -1 *.c *.h | xargs); do
    install -Dm644 $i "${install_dir}/"
  done

  install -Dm644 blacklist.conf "${pkgdir}/etc/modprobe.d/blacklist_snd_hda_scodec_cs35l41.conf"

}

