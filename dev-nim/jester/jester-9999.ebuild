# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="sinatra-like web framework for Nim"
HOMEPAGE="https://github.com/dom96/jester/"
EGIT_REPO_URI="https://github.com/dom96/jester/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-lang/nim-0.15.0
"
RDEPEND=""

src_install() {
	dodir /usr/share/nim/lib/packages/${PN}
	insinto /usr/share/nim/lib/packages/${PN}
	doins ${PN}.nim
	doins -r private
}
