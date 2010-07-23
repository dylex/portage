# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/tmux/tmux-1.2.ebuild,v 1.9 2010/07/02 12:22:11 grobian Exp $

DESCRIPTION="Terminal multiplexer"
HOMEPAGE="http://tmux.sourceforge.net"
#SRC_URI="mirror://sourceforge/tmux/${P}.tar.gz"
ECVS_SERVER="${PN}.cvs.sourceforge.net:/cvsroot/${PN}"
ECVS_MODULE="${PN}"

inherit eutils toolchain-funcs cvs

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="vim-syntax"

DEPEND="dev-libs/libevent
	sys-libs/ncurses"
RDEPEND="${DEPEND}
	vim-syntax? ( || (
			app-editors/vim
			app-editors/gvim ) )"

S=${WORKDIR}/${ECVS_MODULE}

src_compile() {
	# The configure script isn't created by GNU autotools.
	./configure || die "configure failed"
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	dobin tmux || die "dobin failed"

	dodoc CHANGES FAQ NOTES TODO || die "dodoc failed"
	docinto examples
	dodoc examples/*.conf || die "dodoc examples failed"

	doman tmux.1 || die "doman failed"

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins examples/tmux.vim || die "doins syntax failed"
	fi
}
