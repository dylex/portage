# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Pidgin libpurple bridge to signald"
HOMEPAGE="https://github.com/hoehermann/purple-signald"
EGIT_REPO_URI="https://github.com/hoehermann/purple-signald"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-im/pidgin"
RDEPEND="${DEPEND}"
BDEPEND=""
