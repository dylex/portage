EAPI=5

inherit git-r3

DESCRIPTION="A collection fonts for FIGlet"
HOMEPAGE="http://github.com/cmatsuoka/figlet-fonts"
EGIT_REPO_URI="git://github.com/cmatsuoka/figlet-fonts.git"
LICENSE="public-domain" # really none
SLOT="0"
KEYWORDS="*"

src_install() {
	rm -rf ours # included with figlet
	mv contributed/banner.flf contributed/banner2.flf # conflicts with ours
	insinto /usr/share/figlet
	doins **/*.flf **/*.flc **/*.tlf
	dodoc README Obanner.README cjkfonts.readme bdffonts/bdffont1.txt cjkfonts/README.cjk
	newdoc Obanner-canon/README README.Obanner-canon
	newdoc Obanner/README README.Obanner-canon
	newdoc bdffonts/LEGAL\ NOTICE LEGAL-NOTICE.bdffonts
}
