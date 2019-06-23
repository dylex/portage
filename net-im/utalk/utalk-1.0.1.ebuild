# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="utalk UDP-based full screen talk program"
HOMEPAGE="http://utalk.ourproject.org/"
SRC_URI="https://ourproject.org/frs/download.php/408/${PN}-beta.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}"/termcap-cursor.patch
	eapply_user
}

src_compile() {
	emake LIBS=-lncurses EXTRALIBS= BINDIR=${EPREFIX}/bin MANDIR=${EPREFIX}/man LIBDIR=${EPREFIX}/lib
}

src_install() {
	dobin utalk
	doman utalk.1
	dolib utalk.help
}
