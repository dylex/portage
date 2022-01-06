EAPI=8

inherit haskell-cabal

DESCRIPTION="Multi-file, colored, filtered log tailer"
HOMEPAGE="https://dylex.net/src"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz
	http://hackage.haskell.org/package/${PV}/${PN}.cabal"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="inotify"

DEPEND="dev-lang/ghc
	inotify? ( dev-haskell/hinotify )
	dev-haskell/regex-compat
	dev-haskell/unordered-containers
	dev-haskell/time-compat"
RDEPEND="${DEPEND}"

src_compile() {
	if use inotify; then
		CABAL_CONFIGURE_FLAGS="$CABAL_CONFIGURE_FLAGS --flags=inotify"
	fi
	cabal_src_compile
}
