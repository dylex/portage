# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="an API for Signal"
HOMEPAGE="https://signald.org/"
SRC_URI="https://gitlab.com/signald/${PN}/-/archive/${PV}/${P}.tar.gz"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/signald/${PN}.git"
	SRC_URI=""
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	acct-group/signald
	acct-user/signald
	|| ( virtual/jdk:17 virtual/jre:17 )
"
RDEPEND="${DEPEND}"
BDEPEND="app-eselect/eselect-gradle"

src_compile () {
	ewarn "BROKEN WITH network-sandbox!"
	gradle -g $T/gradle installDist --no-daemon || die
}

src_install () {
	insinto /usr/lib/signald
	doins -r build/install/signald/lib
	exeinto /usr/lib/signald/bin
	doexe build/install/signald/bin/signald
	dosym ../lib/signald/bin/signald /usr/bin/signald

	keepdir /var/lib/signald
	fowners signald:signald /var/lib/signald

	newinitd "${FILESDIR}"/signald.initd signald
}
