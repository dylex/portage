EAPI=3

MY_PV="${PV/f/fruit}"
MY_P=${PN}-${MY_PV}

inherit eutils

DESCRIPTION="Secure, reliable, scalable and usable instant messaging services"
HOMEPAGE="http://www.gale.org/"
SRC_URI="http://download.ofb.net/gale/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="adns"

DEPEND="
	dev-libs/openssl
	dev-libs/boehm-gc
	adns? ( net-libs/adns )"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i '/(PROG_LDCONFIG)/d' Makefile.am Makefile.in liboop/Makefile.am liboop/Makefile.in
}

src_configure() {
	econf $(use_enable adns)
}

src_install() {
	emake DESTDIR="${D}" install || die
	newinitd "${FILESDIR}"/${PN}.init gale || die
}

pkg_postinst() {
	enewgroup gale
	enewuser gale -1 -1 /etc/gale gale
}

pkg_config() {
	CONF_GALE_USER=gale "${ROOT}"/usr/bin/gale-install
}
