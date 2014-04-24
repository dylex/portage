# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xdaliclock/xdaliclock-2.40.ebuild,v 1.1 2013/12/04 07:56:59 xmw Exp $

EAPI=5

inherit autotools eutils git-r3

DESCRIPTION="Dali Clock is a digital clock. When a digit changes, it melts into its new shape."
HOMEPAGE="http://www.jwz.org/xdaliclock"
#SRC_URI="http://www.jwz.org/${PN}/${P}.tar.gz"
EGIT_REPO_URI=${EGIT_REPO_URI:-"git://github.com/dylex/xdaliclock.git"}

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
"
DEPEND="
	${RDEPEND}
	x11-proto/xextproto
	x11-proto/xproto
"

S=${WORKDIR}/${P}/X11

src_prepare() {
	cd ${S}
	eautoreconf
}

src_install() {
	dobin ${PN}
	newman ${PN}.man ${PN}.1
	dodoc ../README
}
