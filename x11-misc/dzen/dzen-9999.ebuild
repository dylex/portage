# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs git-r3

DESCRIPTION="General purpose messaging, notification, and menu utility"
HOMEPAGE="https://github.com/robm/dzen"
EGIT_REPO_URI="https://github.com/dylex/dzen.git"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="2"
IUSE="minimal xinerama xpm"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXft
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto"
BDEPEND="
	virtual/pkgconfig"

src_prepare() {
	default
	sed -i '/strip/d; /@echo/d; s/\t@/\t/; s/-L.*/$(X11LIBS)/' \
		Makefile gadgets/Makefile || die
}

src_compile() {
	local cflags="${CFLAGS} $($(tc-getPKG_CONFIG) --cflags x11)"
	local libs="$($(tc-getPKG_CONFIG) --libs x11)"

	if ! use minimal ; then
		emake -C gadgets \
			CC="$(tc-getCC)" CFLAGS="${cflags}" \
			LDFLAGS="${LDFLAGS}" X11LIBS="${libs}"
	fi

	local flag
	# xft always-enabled wrt bug #477656
	for flag in xft $(usev xinerama) $(usev xpm); do
		cflags+=" $($(tc-getPKG_CONFIG) --cflags ${flag}) -DDZEN_${flag^^}"
		libs+=" $($(tc-getPKG_CONFIG) --libs ${flag})"
	done

	cflags+=" -DVERSION='\"$(ver_cut 1-3)\"'"

	emake CC="$(tc-getCC)" CFLAGS="${cflags}" LIBS="${LDFLAGS} ${libs}"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
	if ! use minimal ; then
		emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" -C gadgets install
		dobin gadgets/*.sh
		dodoc gadgets/README*
	fi
	einstalldocs
}
