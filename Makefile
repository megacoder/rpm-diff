TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

INSTALL=install

.PHONY: ${TARGETS} ${SUBDIRS}

all::	rpm-diff

${TARGETS}::

clobber distclean:: clean

check::	rpm-diff
	./rpm-diff ${ARGS}

install:: rpm-diff
	${INSTALL} -D rpm-diff ${BINDIR}/rpm-diff

uninstall::
	${RM} ${BINDIR}/rpm-diff

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
