# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xdaliclock/xdaliclock-2.25.ebuild,v 1.1 2008/05/14 19:11:43 drac Exp $

EAPI=3

DESCRIPTION="Dali Clock is a digital clock. When a digit changes, it melts into its new shape."
HOMEPAGE="http://www.jwz.org/xdaliclock"
#SRC_URI="http://www.jwz.org/${PN}/${P}.tar.gz"
EGIT_REPO_URI="file:///usr/local/src/${PN}"
EGIT_BRANCH="${PV}"
EGIT_STORE_DIR="${WORKDIR}/git-src"

inherit autotools eutils git

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXt
	x11-libs/libXext"
DEPEND="${RDEPEND}
	x11-proto/xextproto
	x11-proto/xproto"

src_prepare() {
	S=${WORKDIR}/${P}/X11
	cd ${S}
	eautoreconf
}

src_install() {
	dodir /usr/bin
	dodir /usr/share/man/man1
	emake install_prefix="${D}" install || die "emake install failed."
	dodoc ../README
}