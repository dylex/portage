# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ml/pgocaml/pgocaml-1.7.1.ebuild,v 1.1 2013/07/22 01:10:48 aballier Exp $

EAPI=5

inherit eutils

MY_PN="${PN}-classic"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="PG'OCaml is a set of OCaml bindings for the PostgreSQL database"
HOMEPAGE="http://pgocaml.forge.ocamlcore.org/"
SRC_URI="http://download2.berlios.de/pgocaml/${MY_P}.tgz"

S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-2.1-with-linking-exception"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="dev-ml/calendar:=
	dev-ml/csv:=
	dev-ml/pcre-ocaml:="
RDEPEND="${DEPEND}"

DOCS=( "README.txt" "BUGS.txt" "CONTRIBUTORS.txt" "HOW_IT_WORKS.txt" )

src_prepare() {
	epatch_user
}

src_configure() {
	emake depend
}
