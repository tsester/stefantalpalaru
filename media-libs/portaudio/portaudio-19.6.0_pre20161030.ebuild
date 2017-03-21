# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils multilib-minimal

MY_P=pa_stable_v${PV/pre}
MY_P=${MY_P//./0}

DESCRIPTION="A free, cross-platform, open-source, audio I/O library"
HOMEPAGE="http://www.portaudio.com/"
SRC_URI="http://www.portaudio.com/archives/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-fbsd ~amd64-linux ~x86-linux"
IUSE="alsa +cxx debug jack oss static-libs"

RDEPEND="
	alsa? ( >=media-libs/alsa-lib-1.0.27.2[${MULTILIB_USEDEP}] )
	jack? ( virtual/jack[${MULTILIB_USEDEP}] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/${PN}
DOCS=( README.txt )
HTML_DOCS=( index.html )

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_configure() {
	econf \
		$(use_enable debug debug-output) \
		$(use_enable cxx) \
		$(use_enable static-libs static) \
		$(use_with alsa) \
		$(use_with jack) \
		$(use_with oss)
}

multilib_src_compile() {
	emake lib/libportaudio.la
	default
}

multilib_src_install() {
	default
	prune_libtool_files
}
