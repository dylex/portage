EAPI=8

inherit pam

DESCRIPTION="A one-time password login package"
HOMEPAGE="http://www.cl.cam.ac.uk/~mgk25/otpw.html"
SRC_URI="http://www.cl.cam.ac.uk/~mgk25/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/pam virtual/libcrypt"
DEPEND="${RDEPEND}"

src_install() {
	dobin otpw-gen
	doman otpw-gen.1
	dopammod pam_otpw.so
	doman pam_otpw.8
	dodoc README CHANGES otpw.html
}
