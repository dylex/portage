EAPI=3

inherit darcs pam

DESCRIPTION="Over-the-air one-time password generator and PAM module"
HOMEPAGE=""
EDARCS_REPOSITORY="/usr/local/src/otapw"
EDARCS_TOP_DIR="${WORKDIR}/darcs-src"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/pam"
RDEPEND="${DEPEND}"

src_install() {
	dobin otapw
	dopammod pam_otapw.so
}
