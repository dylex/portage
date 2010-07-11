EAPI=3

inherit darcs autotools

DESCRIPTION="Ginsu Gale Chat Client"
HOMEPAGE="http://repetae.net/john/computer/ginsu/"
EDARCS_REPOSITORY="/usr/local/src/ginsu"
EDARCS_REPOSITORY_BASE="http://repetae.net/john/repos/ginsu"
EDARCS_TOP_DIR="${WORKDIR}/darcs-src"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/ghc
	dev-libs/openssl
	sys-libs/ncurses
	dev-haskell/network
	dev-haskell/parsec
	dev-haskell/mtl
	dev-haskell/binary"
RDEPEND="${DEPEND}"

src_unpack() {
	darcs_src_unpack
	# hacky. should unpack to TOP_DIR and move
	EDARCS_REPOSITORY="${EDARCS_REPOSITORY}/Doc" EDARCS_LOCALREPO="$S/Doc" darcs_fetch
	EDARCS_REPOSITORY="${EDARCS_REPOSITORY}/Boolean" EDARCS_LOCALREPO="$S/Boolean" darcs_fetch
}

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ginsu.config.sample
}
