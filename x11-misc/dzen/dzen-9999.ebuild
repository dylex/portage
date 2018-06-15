# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dzen/dzen-0.8.5.ebuild,v 1.6 2010/06/06 09:49:15 ssuominen Exp $

EAPI=6

SLOT="2"
MY_P="${PN}${SLOT}-${PV}"

DESCRIPTION="a general purpose messaging, notification and menuing program for X11."
HOMEPAGE="http://gotmor.googlepages.com/dzen"
EGIT_REPO_URI="git://github.com/dylex/dzen.git"

inherit toolchain-funcs multilib git-r3

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE="minimal xinerama xpm"

RDEPEND="x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )
	x11-libs/libXft"
DEPEND="${RDEPEND}
	xinerama? ( x11-proto/xineramaproto )"

#S=${WORKDIR}/${MY_P}

src_prepare() {
	eapply_user

	#cd ${S}
	sed -i \
		-e 's:../dzen2:dzen2:' \
		gadgets/kittscanner.sh || die

	sed -e "s:/usr/local:/usr:g" \
		-e 's:-Os::g' \
		-e "s:CFLAGS =:CFLAGS +=:g" \
		-e '/^CC.*/d' \
		-e 's:^LDFLAGS =:LDFLAGS +=:' \
		-e "s:/usr/lib :/usr/$(get_libdir):" \
		-i config.mk gadgets/config.mk || die "sed failed"
	sed -i -e "/strip/d" Makefile gadgets/Makefile || die "sed failed"
	if use xinerama ; then
		sed -e "/^LIBS/s/$/\ -lXinerama/" \
			-e "/^CFLAGS/s/$/\ -DDZEN_XINERAMA/" \
			-i config.mk || die "sed failed"
	fi
	if use xpm ; then
		sed -e "/^LIBS/s/$/\ -lXpm/" \
			-e "/^CFLAGS/s/$/\ -DDZEN_XPM/" \
			-i config.mk || die "sed failed"
	fi
	chmod +x gadgets/
}

src_compile() {
	tc-export CC
	emake || die "emake failed"

	if ! use minimal ; then
		cd "${S}"/gadgets
		emake || die "emake gadgets failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README || die

	if ! use minimal ; then
		cd "${S}"/gadgets
		emake DESTDIR="${D}" install || die "emake gadgets install failed"
		dodoc README* || die
	fi
}
