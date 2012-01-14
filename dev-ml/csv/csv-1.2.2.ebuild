EAPI=3

inherit eutils findlib

DESCRIPTION="a pure OCaml library to read and write CSV files"
HOMEPAGE="http://csv.forge.ocamlcore.org/"
SRC_URI="https://forge.ocamlcore.org/frs/download.php/613/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE="+ocamlopt"

DEPEND="
	dev-ml/findlib
	dev-lang/ocaml[ocamlopt?]"
RDEPEND="${DEPEND}"

src_compile() {
	if use ocamlopt; then
		emake || die
	else
		emake byte || die
	fi
}

src_install() {
	findlib_src_install
}
