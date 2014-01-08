# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit webapp

MY_PN="fantasy-island"
MY_PV=${PV/_/-}
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Open Source Q&A System"
HOMEPAGE="http://www.osqa.net"
SRC_URI="http://svn.osqa.net/svnroot/osqa/releases/${MY_P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/django-1.1
	dev-python/markdown
	dev-python/html5lib
	dev-python/python-openid
	dev-python/south
	www-apache/mod_wsgi"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	webapp_src_preinst

    dodoc INSTALL LICENSE
	docinto examples
    dodoc -r cron

	ln -s forum/skins m

	insinto "${MY_HTDOCSDIR}"
	mkdir cache
    doins -r *.py settings_local.py.dist osqa.wsgi.dist cache tmp log forum forum_modules locale m

	#webapp_configfile "${MY_HTDOCSDIR}"/osqa.wsgi
	#webapp_configfile "${MY_HTDOCSDIR}"/settings_local.py
	webapp_serverowned "${MY_HTDOCSDIR}"/tmp
	webapp_serverowned "${MY_HTDOCSDIR}"/cache
	webapp_serverowned "${MY_HTDOCSDIR}"/log

	webapp_src_install
}
