EAPI=3

CABAL_FEATURES="bin"
inherit darcs haskell-cabal

DESCRIPTION="Multi-file, colored, filtered log tailer"
HOMEPAGE="https://dylex.net:9947/src"
EDARCS_REPOSITORY="/usr/local/src/ztail"
EDARCS_TOP_DIR="${WORKDIR}/darcs-src"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="inotify"

DEPEND="dev-lang/ghc
	inotify? ( dev-haskell/hinotify )"
RDEPEND="${DEPEND}"

src_compile() {
	if use inotify; then
		CABAL_CONFIGURE_FLAGS="$CABAL_CONFIGURE_FLAGS --flags=inotify"
	fi
	cabal_src_compile
}
