EAPI=7

inherit font git-r3

DESCRIPTION="Monospace terminal fonts for text and coding."
HOMEPAGE="http://github.com/dylex/fonts"
EGIT_REPO_URI="https://github.com/dylex/fonts.git"
LICENSE="CC0-1.0 BSD"
SLOT="0"
KEYWORDS="amd64"
FONT_S=${S}
FONT_SUFFIX="pcf.gz"

BDEPEND="x11-apps/bdftopcf"
