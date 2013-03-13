EAPI=5

inherit git

MY_PV="${PV##*.}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="The (ex-)gnome-utils stripchart plotting utility"
HOMEPAGE="http://github.com/dylex/${PN}"
EGIT_REPO_URI="git://github.com/dylex/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=x11-libs/gtk+-2 dev-libs/libxml2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
	dobin stripchart || die
}
