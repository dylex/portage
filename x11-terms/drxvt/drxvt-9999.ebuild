EAPI=2
inherit autotools eutils git-r3

DESCRIPTION="rxvt clone based on mrxvt"
HOMEPAGE="http://materm.sourceforge.net/"
EGIT_REPO_URI="https://github.com/dylex/drxvt.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="debug truetype utempter minimal 256-color rgb-color"

RDEPEND="utempter? ( sys-libs/libutempter )
	truetype? ( x11-libs/libXft
		media-libs/fontconfig
		media-libs/freetype )
	x11-libs/libX11
	x11-libs/libXt
	x11-libs/libXrender"

DEPEND="${RDEPEND}
	x11-proto/xproto"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myconf

	if use minimal ; then
		myconf="--enable-minimal --enable-pointer-blank --enable-mousewheel"
	else
		myconf="--enable-everything"
	fi

	econf \
		$(use_enable debug) \
		$(use_enable session sessionmgr) \
		$(use_enable truetype xft) \
		$(use_enable utempter) \
		$(use_enable 256-color 256colors) \
		$(use_enable rgb-color rgbcolors) \
		--with-term=${RXVT_TERM:-drxvt} \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" docdir=/usr/share/doc/${PF} install || die
	# Give drxvt perms to update utmp
	fowners root:utmp /usr/bin/drxvt
	fperms g+s /usr/bin/drxvt
	tic -s -o "${D}"/usr/share/terminfo "${D}"/usr/share/doc/${PF}/etc/drxvt.terminfo
	dodoc AUTHORS CREDITS FAQ NEWS README* TODO
}
