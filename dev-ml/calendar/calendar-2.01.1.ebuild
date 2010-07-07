EAPI=3

inherit eutils findlib

DESCRIPTION="An Objective Caml library managing dates and times"
HOMEPAGE="http://calendar.forge.ocamlcore.org/"
SRC_URI="https://forge.ocamlcore.org/frs/download.php/173/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	dev-ml/findlib
	>=dev-lang/ocaml-3.09.1"
RDEPEND="${DEPEND}"

src_install() {
	findlib_src_install
	dodoc README CHANGES
}
