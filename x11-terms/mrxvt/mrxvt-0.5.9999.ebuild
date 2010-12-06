EAPI=2
inherit autotools eutils git

DESCRIPTION="Multi-tabbed rxvt clone with XFT, transparent background and CJK support"
HOMEPAGE="http://materm.sourceforge.net/"
EGIT_REPO_URI="file:///usr/local/src/mrxvt"
EGIT_STORE_DIR="${WORKDIR}/git-src"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

LINGUAS_IUSE="linguas_el linguas_ja linguas_ko linguas_th linguas_zh_CN linguas_zh_TW"
IUSE="debug png jpeg session truetype menubar utempter xpm ${LINGUAS_IUSE} minimal 256color tabs"

RDEPEND="png? ( media-libs/libpng )
	utempter? ( sys-libs/libutempter )
	jpeg? ( media-libs/jpeg )
	truetype? ( x11-libs/libXft
		media-libs/fontconfig
		media-libs/freetype )
	x11-libs/libX11
	x11-libs/libXt
	xpm? ( x11-libs/libXpm )
	x11-libs/libXrender"

DEPEND="${RDEPEND}
	x11-proto/xproto"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myconf

	if use minimal ; then
		myconf="--enable-minimal --disable-xterm-scroll --with-max-profiles=1 --enable-pointer-blank --enable-mousewheel"
	else
		myconf="--enable-everything"
	fi

	# if you want to pass any other flags, use EXTRA_ECONF.
	if use linguas_el ; then
		myconf="${myconf} --enable-greek"
	fi
	if use linguas_ja ; then
		# --with-encoding=sjis
		myconf="${myconf} --enable-kanji --with-encoding=eucj"
	fi
	if use linguas_ko ; then
		myconf="${myconf} --enable-kr --with-encoding=kr"
	fi
	if use linguas_th ; then
		myconf="${myconf} --enable-thai"
	fi
	if use linguas_zh_CN ; then
		# --with-encoding=gbk
		myconf="${myconf} --enable-gb --with-encoding=gb"
	fi
	if use linguas_zh_TW ; then
		myconf="${myconf} --enable-big5 --with-encoding=big5"
	fi

	# 2006-03-13 gi1242: mrxvt works best with TERM=rxvt AND correctly set
	# termcap / terminfo entries. If the rxvt termcap / terminfo entries are
	# messed up then then it's better to set TERM=xterm.
	#
	# Provide support for this by setting the or RXVT_TERM environment variables
	# before emerging, as done in the rxvt ebuild.

	econf \
		--with-atab-extra=25 \
		$(use_enable debug) \
		$(use_enable jpeg) \
		$(use_enable png) \
		$(use_enable xpm) \
		$(use_enable session sessionmgr) \
		$(use_enable truetype xft) \
		$(use_enable utempter) \
		$(use_enable menubar) \
		$(use_enable 256color 256colors) \
		$(use_enable tabs tabs) \
		--with-term ${RXVT_TERM:-mrxvt} \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" docdir=/usr/share/doc/${PF} install || die
	# Give mrxvt perms to update utmp
	fowners root:utmp /usr/bin/mrxvt
	fperms g+s /usr/bin/mrxvt
	tic /usr/share/doc/${PF}/etc/mrxvt.terminfo
	dodoc AUTHORS CREDITS FAQ NEWS README* TODO
}
