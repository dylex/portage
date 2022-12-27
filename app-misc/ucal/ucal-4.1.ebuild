# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="display a calendar (substitute unix cal command)"
HOMEPAGE="http://www.unicorn.us.com/cal.html"
SRC_URI="http://unicorn.us.com/pub/cal41.zip"
S="${WORKDIR}/cal$(ver_rs 1- '')"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake -C src -f makefile.unx
}

src_install() {
	newbin src/cal ucal
	newman src/cal.1 ucal.1
	dodoc readme.cal cal.doc cal.html cal.dat cal.col
}
