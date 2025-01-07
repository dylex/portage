# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="Remind python library"
HOMEPAGE="
	https://pypi.org/project/remind/
	https://github.com/jspricke/python-remind/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]
"
