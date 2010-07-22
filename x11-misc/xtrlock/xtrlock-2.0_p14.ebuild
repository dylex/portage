# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xtrlock/xtrlock-2.0-r2.ebuild,v 1.5 2008/05/12 13:40:44 opfer Exp $

EAPI=3

DESCRIPTION="A simplistic screen locking program for X"
#SRC_URI="mirror://debian/pool/main/x/xtrlock/${MY_P}.tar.gz"
HOMEPAGE="http://ftp.debian.org/debian/pool/main/x/xtrlock/"
EGIT_REPO_URI="file:///usr/local/src/${PN}"
EGIT_BRANCH="${PV/_p/-}"
EGIT_STORE_DIR="${WORKDIR}/git-src"

inherit autotools eutils git

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}
	x11-proto/xproto
	x11-misc/imake"

src_compile() {
	xmkmf || die
	make CFLAGS="${CFLAGS} -DSHADOW_PWD" xtrlock || die
}

src_install() {
	dobin xtrlock
	chmod u+s "${D}"/usr/bin/xtrlock
	mv xtrlock.man xtrlock.1
	doman xtrlock.1
}
