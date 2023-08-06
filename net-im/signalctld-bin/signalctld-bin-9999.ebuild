# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a cli client for signald"
HOMEPAGE="https://signald.org/signaldctl/"
SRC_URI="https://gitlab.com/api/v4/projects/21018340/jobs/artifacts/main/raw/signaldctl?job=build%3Ax86 -> signalctld"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	insinto /usr
	dobin ${DISTDIR}/signalctld
}
