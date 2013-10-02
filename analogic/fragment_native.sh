#!/bin/sh
#@(#)Compilation de ferdinand � partir de ferdinand_fragment_native.ml
#@(#)Copyright St�phane Grognet 2012, 2013
#@(#)Laboratoire de math�matiques Jean Leray UMR 6629 CNRS
#@(#)F�d�ration de recherche math�matique des Pays de la Loire
#@(#)IREM des Pays de la Loire - Universit� de Nantes
#@(#)version 0.4

ocamlopt.opt -linkall -o ferdinand -I ../util -I ../matrix -I ../readwrite -I ../infinitesimal -I ../draw -I ../widget /usr/local/lib/ocaml/graphics.cmxa /usr/local/lib/ocaml/nums.cmxa /usr/local/lib/ocaml/str.cmxa /usr/local/lib/ocaml/unix.cmxa ../util/util.cmxa ../matrix/matrix.cmxa ../readwrite/readwrite.cmxa ../infinitesimal/infinitesimal.cmxa ../draw/draw.cmxa ../widget/widget.cmxa analogic.cmxa ferdinand_native.ml

exit 0

