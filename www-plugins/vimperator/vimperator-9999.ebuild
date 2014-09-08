EAPI=3

DESCRIPTION="Make Firefox behave like Vim"
HOMEPAGE="http://vimperator.org"
EHG_REPO_URI="/usr/local/src/vimperator"
EHG_STORE_DIR="${WORKDIR}/hg-src"

inherit mozextension mercurial

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${EHG_PROJECT}
MOZILLA_FIVE_HOME=/usr/lib/firefox/browser

src_compile() {
	cd ${S}
	emake vimperator.xpi || die
}

src_install() {
	xpiname=${S}/downloads/vimperator-*.xpi
	xpi_unpack $xpiname 
	xpibase=$(basename $xpiname)
	xpi_install ${WORKDIR}/${xpibase%.xpi}
}
