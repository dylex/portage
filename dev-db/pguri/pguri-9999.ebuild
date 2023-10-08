EAPI="7"

POSTGRES_COMPAT=( 9.6 {10..15} )

inherit git-r3 postgres-multi

DESCRIPTION="A simple PostgreSQL URI type"
HOMEPAGE="https://github.com/dylex/pguri"
EGIT_REPO_URI="https://github.com/dylex/${PN}.git"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${POSTGRES_DEP}"
RDEPEND="${DEPEND}"

src_compile() {
	postgres-multi_foreach emake -e
}

src_install() {
	postgres-multi_foreach emake -e DESTDIR="${D}" install
}
