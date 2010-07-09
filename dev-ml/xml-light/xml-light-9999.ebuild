EAPI=3

ECVS_SERVER="cvs.motion-twin.com:/cvsroot"
ECVS_MODULE="ocaml/xml-light"
ECVS_USER="anonymous"

inherit eutils cvs findlib

DESCRIPTION="Xml-Light is a minimal XML parser & printer for OCaml"
HOMEPAGE="http://tech.motion-twin.com/xmllight.html"
SRC_URI=""

LICENSE="LGPL-2.1-linking-exception"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ocamlopt"

DEPEND="dev-lang/ocaml[ocamlopt?]
	dev-ml/findlib"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${ECVS_MODULE}

src_unpack() {
	cvs_src_unpack
	cd "${S}"
	sed -e 's/@VERSION@/[CVS]/' META.in > META
}

src_compile() {
	emake all || die
	if use ocamlopt; then
		emake opt || die
	fi
}

src_install() {
	findlib_src_preinst
	ocamlfind install xml-light xml.cm[ix] xmlParser.cm[ix] dtd.cm[ix] xml-light.* META
}
