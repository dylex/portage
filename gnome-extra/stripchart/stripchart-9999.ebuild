EAPI=7

inherit git-r3

DESCRIPTION="The (ex-)gnome-utils stripchart plotting utility"
HOMEPAGE="http://github.com/dylex/stripchart"
EGIT_REPO_URI="https://github.com/dylex/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/gtk+:2 dev-libs/libxml2"
RDEPEND="${DEPEND}"

src_install() {
	dobin stripchart || die
}
