EAPI=6

inherit git-r3

DESCRIPTION="GNU/Linux application to control backlights"
EGIT_REPO_URI="https://github.com/haikarainen/${PN}.git"
HOMEPAGE="https://github.com/haikarainen/{PN}"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-apps/help2man"

src_compile() {
	emake CC=$(tc-getCC) CFLAGS="${CFLAGS} -Iinclude"
}

src_install() {
	emake install PREFIX="${D}${EPREFIX}/usr" DESTDIR="${D}"
}
