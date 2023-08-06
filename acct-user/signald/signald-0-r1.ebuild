# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="A user for net-im/signald"
ACCT_USER_ID=737
ACCT_USER_GROUPS=( signald )

acct-user_add_deps
