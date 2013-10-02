#!/bin/sh
#@(#)Making calculation libraries in native code for Ocaml.
#@(#)Copyright St�phane Grognet 2012, 2013
#@(#)Laboratoire de math�matiques Jean Leray UMR 6629 CNRS
#@(#)F�d�ration de recherche math�matique des Pays de la Loire
#@(#)IREM des Pays de la Loire - Universit� de Nantes
#@(#)version 0.4

#################
# Pr�liminaires #
#################

if [ $# -lt 1 ];
    then
    echo "Error: missing inline parameter."
    exit 1
fi

if [ $# -gt 1 ];
    then
    echo "Error: more than one inline parameter."
    exit 1
fi

echo "Inline parameter: "$1

OCAMLBIN=`which ocaml`
BINDIR=`dirname $OCAMLBIN`
LIBDIR=`dirname $BINDIR`"/lib/ocaml"

###############
# Compilation #
###############

# Each one of the two following compilations uses nearly two gigabytes of random access memory.
# If the need arises, suppress "&".
# Chacune des deux compilations suivantes consomme pr�s de deux gigaoctets de m�moire vive.
# Le cas �ch�ant, supprimer "&".

ocamlopt.opt -c -inline $1 -o math.cmx ${LIBDIR}/nums.cmxa ${LIBDIR}/str.cmxa math.ml &
ocamlopt.opt -c -inline $1 -o graphicmath/graphicmath.cmx ${LIBDIR}/graphics.cmxa ${LIBDIR}/nums.cmxa ${LIBDIR}/str.cmxa ${LIBDIR}/unix.cmxa graphicmath/graphicmath.ml ;

fg ;

ocamlopt.opt -a -linkall -inline $1 -o graphicmath/graphicmath.cmxa graphicmath/graphicmath.cmx
ocamlopt.opt -a -linkall -inline $1 -o math.cmxa math.cmx

rm math.o &
rm graphicmath/graphicmath.o ;


exit 0

