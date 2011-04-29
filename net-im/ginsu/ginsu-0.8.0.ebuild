EAPI=3

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="Ginsu Gale Chat Client"
HOMEPAGE="http://repetae.net/john/computer/ginsu/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/openssl
	sys-libs/ncurses"
DEPEND="${RDEPEND}
	dev-lang/ghc
	dev-haskell/network
	dev-haskell/parsec
	dev-haskell/mtl
	dev-haskell/binary
	dev-haskell/cabal"
