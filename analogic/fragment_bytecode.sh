#!/bin/sh
#@(#)Compilation de ferdinand.o � partir de ferdinand_fragment_bytecode.ml
#@(#)Copyright St�phane Grognet 2012, 2013
#@(#)Laboratoire de math�matiques Jean Leray UMR 6629 CNRS
#@(#)F�d�ration de recherche math�matique des Pays de la Loire
#@(#)IREM des Pays de la Loire - Universit� de Nantes
#@(#)version 0.4

ocamlc.opt -linkall -o ferdinand.cmo -I ../util -I ../matrix -I ../readwrite -I ../infinitesimal -I ../draw -I ../widget /usr/local/lib/ocaml/graphics.cma /usr/local/lib/ocaml/nums.cma /usr/local/lib/ocaml/str.cma /usr/local/lib/ocaml/unix.cma ../util/util.cma ../matrix/matrix.cma ../readwrite/readwrite.cma ../infinitesimal/infinitesimal.cma ../draw/draw.cma ../widget/widget.cma analogic.cma ferdinand_bytecode.ml


# The compilation is assumed to be done on a BSD system, where the path to ocamlrun is "/usr/local/bin/ocamlrun"
# and the shebang is "#!/usr/local/bin/ocamlrun", consisting in 25 charactgers.

echo -n "#!/usr/bin/ocamlrun" > nonBSDferdinand.cmo
tail -c +26 ferdinand.cmo >> nonBSDferdinand.cmo

exit 0

