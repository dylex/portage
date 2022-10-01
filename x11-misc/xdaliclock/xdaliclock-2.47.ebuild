# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Dali Clock is a digital clock. When a digit changes, it melts into its new shape"
HOMEPAGE="https://www.jwz.org/xdaliclock"
#SRC_URI="https://www.jwz.org/xdaliclock/${P}.tar.gz"
EGIT_REPO_URI=${EGIT_REPO_URI:-"https://github.com/dylex/xdaliclock.git"}
EGIT_BRANCH="${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
"

S=${WORKDIR}/${P}/X11/Xlib-classic

src_install() {
	dobin ${PN}
	newman ${PN}.man ${PN}.1
	dodoc ../README
}
