EAPI=7

inherit git-r3 autotools

DESCRIPTION="GNU/Linux application to control backlights"
EGIT_REPO_URI="https://github.com/haikarainen/${PN}.git"
HOMEPAGE="https://github.com/haikarainen/light"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-apps/help2man"

src_prepare() {
	default
	eautoreconf
}
