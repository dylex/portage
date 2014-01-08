# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/sphinxcontrib-httpdomain/sphinxcontrib-httpdomain-1.2.0.ebuild,v 1.1 2013/10/28 07:17:11 patrick Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1 mercurial

DESCRIPTION="Extension providing a Sphinx domain for describing Ruby APIs"
HOMEPAGE="http://bitbucket.org/birkenfeld/sphinx-contrib/ \
	http://packages.python.org/sphinxcontrib-rubydomain/"
EHG_REPO_URI="https://bitbucket.org/birkenfeld/sphinx-contrib"
EHG_PROJECT="sphinx-contrib"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND=">=dev-python/sphinx-1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

# We can't set S because that messes up mercurial_fetch

src_compile() {
	cd ${PN#sphinxcontrib-}
	distutils-r1_src_compile "$@"
}

src_install() {
	cd ${PN#sphinxcontrib-}
	distutils-r1_src_install "$@"
}
