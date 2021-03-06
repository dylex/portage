EAPI=8

inherit darcs haskell-cabal

DESCRIPTION="Multi-file, colored, filtered log tailer"
HOMEPAGE="https://dylex.net/src"
EDARCS_REPOSITORY="http://hub.darcs.net/dylex/ztail"
EDARCS_TOP_DIR="${WORKDIR}/darcs-src"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="inotify"

DEPEND="dev-lang/ghc
	dev-haskell/regex-posix:0
	dev-haskell/unordered-containers
	inotify? ( dev-haskell/hinotify )"
RDEPEND="${DEPEND}"

src_compile() {
	if use inotify; then
		CABAL_CONFIGURE_FLAGS="$CABAL_CONFIGURE_FLAGS --flags=inotify"
	fi
	cabal_src_compile
}
