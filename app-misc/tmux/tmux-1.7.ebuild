# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/tmux/tmux-1.7.ebuild,v 1.1 2012/10/13 17:18:59 radhermit Exp $

EAPI=4

inherit eutils autotools git-2

DESCRIPTION="Terminal multiplexer"
HOMEPAGE="http://tmux.sourceforge.net"

EGIT_REPO_URI=${EGIT_REPO_URI:-"https://github.com/dylex/xtmux.git"}
EGIT_NOUNPACK=1
if use X ; then
	EGIT_BRANCH="${PV}"
else
    EGIT_BRANCH="nox/${PV}"
fi

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~x64-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="X vim-syntax"

COMMON_DEPEND="
	>=dev-libs/libevent-2.0.10
	sys-libs/ncurses
	X? (
		x11-libs/libX11	
	)"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig"
RDEPEND="${COMMON_DEPEND}
	vim-syntax? ( || (
		app-editors/vim
		app-editors/gvim ) )"

DOCS=( CHANGES FAQ NOTES TODO )

pkg_setup() {
	if has_version "<app-misc/tmux-1.7"; then
		echo
		ewarn "Some configuration options changed in this release."
		ewarn "Please read the CHANGES file in /usr/share/doc/${PF}/"
		ewarn
		ewarn "WARNING: after updating to ${P} you will _not_ be able to connect to any"
		ewarn "running 1.6 tmux server instances. You'll have to use an existing client to"
		ewarn "end your old sessions or kill the old server instances. Otherwise you'll have"
		ewarn "to temporarily downgrade to tmux 1.6 to access them."
		echo
	fi
}

src_prepare() {
	eautoreconf
	# look for config file in the prefix
	sed -i -e '/SYSTEM_CFG/s:"/etc:"'"${EPREFIX}"'/etc:' tmux.h || die
	# and don't just add some includes
	sed -i -e 's:-I/usr/local/include::' Makefile.in || die
}

src_install() {
	default

	docinto examples
	dodoc examples/*.conf

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins examples/tmux.vim

		insinto /usr/share/vim/vimfiles/ftdetect
		doins "${FILESDIR}"/tmux.vim
	fi

	use X && tic -s -o "${D}"/usr/share/terminfo examples/xtmux.terminfo
}
