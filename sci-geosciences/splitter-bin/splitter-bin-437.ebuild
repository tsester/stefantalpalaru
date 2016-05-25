# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit java-pkg-2

DESCRIPTION="Tile splitter for mkgmap"
HOMEPAGE="http://www.mkgmap.org.uk/page/tile-splitter"
MY_PN=${PN%-bin}
SRC_URI="http://www.mkgmap.org.uk/${MY_PN}/${MY_PN}-r${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
DEPEND=""
RDEPEND=">=virtual/jre-1.6"

S="${WORKDIR}/${MY_PN}-r${PV}"

src_compile() {
	:
}

src_install() {
	java-pkg_dojar "${MY_PN}.jar"
	java-pkg_jarinto "/usr/share/${PN}/lib/lib"
	java-pkg_dojar lib/*.jar
	java-pkg_dolauncher "${MY_PN}" --jar "${MY_PN}.jar" || die "java-pkg_dolauncher failed"

	dodoc doc/intro.txt
}
