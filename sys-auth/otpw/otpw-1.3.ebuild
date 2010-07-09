# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils pam

DESCRIPTION="A one-time password login package"
HOMEPAGE="http://www.cl.cam.ac.uk/~mgk25/otpw.html"
SRC_URI="http://www.cl.cam.ac.uk/~mgk25/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="virtual/pam"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/otpw-fPIC.patch"
}

src_compile() {
	emake || die
}

src_install() {
	dobin otpw-gen
	doman otpw-gen.1
	dopammod pam_otpw.so
	doman pam_otpw.8
	dodoc README otpw.html
}
