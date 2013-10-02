#!/bin/sh
#@(#)Opam adaptation of the calculation pseudo-interpreters.
#@(#)Copyright St�phane Grognet 2013
#@(#)Laboratoire de math�matiques Jean Leray UMR 6629 CNRS
#@(#)F�d�ration de recherche math�matique des Pays de la Loire
#@(#)IREM des Pays de la Loire - Universit� de Nantes
#@(#)version 0.4

BINDIR=`opam config env | grep ^PATH | cut -d: -f1 | cut -d= -f2`
LIBDIR=`dirname $BINDIR`"/lib/ocamlmath/graphicmath"
STANDARD=`which ocamlrun`

if [ $STANDARD = "/usr/local/bin/ocamlrun" ]; then
    TOPMATH="topgraphicmath"
else
    TOPMATH="nonBSDtopgraphicmath"
fi

which ledit > /dev/null
LEDIT=`echo $?`

if [ $LEDIT = 0 ]; then
    ledit ${LIBDIR}/${TOPMATH} -I ${LIBDIR} -init ${LIBDIR}/.ocamlinit
else
    ${LIBDIR}/${TOPMATH} -I ${LIBDIR} -init ${LIBDIR}/.ocamlinit
fi

exit 0

