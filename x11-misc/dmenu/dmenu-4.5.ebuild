# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dmenu/dmenu-4.5.ebuild,v 1.1 2012/01/09 13:04:37 jer Exp $

EAPI="4"

inherit toolchain-funcs eutils

DESCRIPTION="a generic, highly customizable, and efficient menu for the X Window System"
HOMEPAGE="http://www.suckless.org/programs/dmenu.html"
SRC_URI="http://dl.suckless.org/tools/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xinerama +xft"

DEPEND="x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	xft? ( x11-libs/libXft )
"
RDEPEND="${DEPEND}"

src_prepare() {
	if use xft; then
		epatch "${FILESDIR}/dmenu-4.5-xft.diff" || die
	fi
	sed -i \
		-e "s/CFLAGS   = -ansi -pedantic -Wall -Os/CFLAGS  += -ansi -pedantic -Wall/" \
		-e "s/LDFLAGS  = -s/LDFLAGS  +=/" \
		-e "s/XINERAMALIBS  =/XINERAMALIBS  ?=/" \
		-e "s/XINERAMAFLAGS =/XINERAMAFLAGS ?=/" \
		config.mk || die
}

src_compile() {
	if use xinerama; then
		emake CC="$(tc-getCC)"
	else
		emake CC="$(tc-getCC)" XINERAMAFLAGS= XINERAMALIBS=
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
