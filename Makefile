# Created by: Li-Wen Hsu <lwhsu@FreeBSD.org>
# $FreeBSD$

PORTNAME=	julia
PORTVERSION=	0.5.0
DISTVERSIONSUFFIX=	-full
CATEGORIES=	lang math
MASTER_SITES=	https://github.com/JuliaLang/julia/releases/download/v${PORTVERSION}/

MAINTAINER=	iblis@hs.ntnu.edu.tw
COMMENT=	The Julia Language: A fresh approach to technical computing

USES=	gmake compiler:c++11-lib fortran

WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION}

BUILD_DEPENDS=	llvm-config38:devel/llvm38 \
		pcre2-config:devel/pcre2 \
		patchelf:sysutils/patchelf

LIB_DEPENDS=	libunwind.so:devel/libunwind \
		libutf8proc.so:textproc/utf8proc \
		libopenblas.so:math/openblas \
		libgit2.so:devel/libgit2 \
		libgmp.so:math/gmp

ALL_TARGET=	default
INSTALL_TARGET=	install
TEST_TARGET=	test

CXXFLAGS+=	-stdlib=libc++ -std=c++11
MAKE_ARGS+=	prefix=${PREFIX} JCXXFLAGS="${CXXFLAGS}" \
		FORCE_ASSERTIONS=${FORCE_ASSERTIONS}

OPTIONS_DEFINE=	EXAMPLES DEBUG DOCS
OPTIONS_SUB=	yes

DEBUG_VARS=	FORCE_ASSERTIONS=1 \
		ALL_TARGET=all

PORTDOCS=	html
DOCS_VARS=	INSTALL_TARGET+=install-docs

PORTEXAMPLES=	*
EXAMPLES_VARS=	INSTALL_TARGET+=install-examples

.include <bsd.port.mk>
