# Maintainer: Nicholas Wang <me at nicho1as dot wang>

_pkgbase=snd-hda-scodec-cs35l41-sandwalker-git
pkgname=${_pkgbase}-dkms
pkgver=6.12.0
pkgrel=1
pkgdesc="Patched cs35l41 HDA driver for HP Sandwalker"
url="https://github.com/nicholascw/aur--dkms"
arch=('any')
license=('GPL2')
depends=('dkms')
source=(
  "cs35l41_hda.c"
  "cs35l41_hda.h"
  "cs35l41_hda_property.c"
  "cs35l41_hda_property.h"
  "dkms.conf"
  "Makefile"
)

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  cd "$srcdir"
  local install_dir="${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}"/dkms.conf

  install -Dm644 cs35l41_hda.c "${install_dir}/cs35l41_hda.c"
  install -Dm644 cs35l41_hda.h "${install_dir}/cs35l41_hda.h"
  install -Dm644 cs35l41_hda_property.c "${install_dir}/cs35l41_hda_property.c"
  install -Dm644 cs35l41_hda_property.h "${install_dir}/cs35l41_hda_property.h"
  install -Dm644 Makefile "${install_dir}/Makefile"
}

