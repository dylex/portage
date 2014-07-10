# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/tmux/tmux-1.9a.ebuild,v 1.1 2014/02/25 07:00:37 radhermit Exp $

EAPI=5
AUTOTOOLS_AUTORECONF=true

inherit autotools-utils bash-completion-r1 flag-o-matic git-r3

DESCRIPTION="Terminal multiplexer"
HOMEPAGE="http://tmux.sourceforge.net"

EGIT_REPO_URI=${EGIT_REPO_URI:-"https://github.com/dylex/xtmux.git"}
if use X ; then
	EGIT_BRANCH="${PV}"
else
    EGIT_BRANCH="nox/${PV}"
fi

LICENSE="ISC"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x64-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="X debug vim-syntax"

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

DOCS=( CHANGES FAQ README README.xtmux TODO )

pkg_setup() {
	if has_version "<app-misc/tmux-1.9"; then
		echo
		ewarn "Some configuration options changed in this release."
		ewarn "Please read the CHANGES file in /usr/share/doc/${PF}/"
		ewarn
		ewarn "WARNING: After updating to ${P} you will _not_ be able to connect to any"
		ewarn "older, running tmux server instances. You'll have to use an existing client to"
		ewarn "end your old sessions or kill the old server instances. Otherwise you'll have"
		ewarn "to temporarily downgrade to access them."
		echo
	fi
}

src_prepare() {
	# bug 438558
	# 1.7 segfaults when entering copy mode if compiled with -Os
	replace-flags -Os -O2

	# regenerate aclocal.m4 to support earlier automake versions
	rm aclocal.m4

	# remove generated files
	rm -r compat/.{dirstamp,deps}

	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		--sysconfdir="${EPREFIX}"/etc
		$(use_enable debug)
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install

	newbashcomp examples/bash_completion_tmux.sh ${PN}

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