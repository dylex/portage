EABI=3

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="FFI interface to syslog(3) from POSIX.1-2001"
HOMEPAGE="http://gitorious.org/hsyslog"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.8.1"
DEPEND="dev-haskell/cabal
		${RDEPEND}"
