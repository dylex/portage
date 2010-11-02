EAPI=3

inherit base

DESCRIPTION="IPv4 and IPv4 range index type for PostgreSQL"
HOMEPAGE="http://pgfoundry.org/projects/ip4r/"
SRC_URI="http://pgfoundry.org/frs/download.php/2607/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-db/postgresql-base"
RDEPEND="${DEPEND}"

src_compile() {
	emake USE_PGXS=1 || die
}

src_install() {
	emake USE_PGXS=1 DESTDIR="${D}" install || die
	dodoc README.ip4r TODO
}
