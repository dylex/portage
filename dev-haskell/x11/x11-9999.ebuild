EAPI=3

CABAL_FEATURES="lib profile haddock hscolour"
inherit darcs haskell-cabal autotools

MY_PN="X11"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A binding to the X11 graphics library"
HOMEPAGE="http://code.haskell.org/X11"
EDARCS_REPOSITORY="/usr/local/src/${MY_PN}"
EDARCS_TOP_DIR="${WORKDIR}/darcs-src"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xinerama"

RDEPEND=">=dev-lang/ghc-6.8
        x11-libs/libX11
        xinerama? ( x11-libs/libXinerama )"

DEPEND="${RDEPEND}
        >=dev-haskell/cabal-1.2"

src_prepare() {
	eautoreconf
}

src_compile() {
	CABAL_CONFIGURE_FLAGS="--configure-option=$(use_with xinerama)"
	cabal_src_compile
}
