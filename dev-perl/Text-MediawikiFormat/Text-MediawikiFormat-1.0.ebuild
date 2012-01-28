# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-WikiFormat/Text-WikiFormat-0.790.0.ebuild,v 1.2 2011/09/03 21:05:30 tove Exp $

EAPI=4

MODULE_AUTHOR=DPRICE
MODULE_VERSION=v1.0
inherit perl-module

DESCRIPTION="Translate Wiki markup into other text formats"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/URI
	virtual/perl-Scalar-List-Utils
	dev-perl/Test-Warn
	dev-perl/Test-NoWarnings"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.28"

SRC_TEST="do"
