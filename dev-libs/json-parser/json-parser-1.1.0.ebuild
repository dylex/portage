EAPI=6

DESCRIPTION="Very low footprint JSON parser written in portable ANSI C"
HOMEPAGE="https://github.com/udp/json-parser"

LICENSE="BSD-2"
SLOT="0"

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="git://github.com/udp/json-parser.git"
	inherit git-r3
else
	SRC_URI="https://github.com/udp/json-parser/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DEPEND=""
RDEPEND=""

src_install() {
	dodir /usr/lib /usr/lib64
	emake DESTDIR="${D}" install
	einstalldocs
}
