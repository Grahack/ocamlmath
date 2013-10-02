#!/bin/sh
#@(#)Compilation de ferdinand
#@(#)Copyright St�phane Grognet 2012, 2013
#@(#)Laboratoire de math�matiques Jean Leray UMR 6629 CNRS
#@(#)F�d�ration de recherche math�matique des Pays de la Loire
#@(#)IREM des Pays de la Loire - Universit� de Nantes
#@(#)version 0.4

ocamlc.opt -linkall -o ferdinand.cmo -I ../util -I ../matrix -I ../readwrite -I ../infinitesimal -I ../draw -I ../widget $1/ocaml/graphics.cma $1/ocaml/nums.cma $1/ocaml/str.cma $1/ocaml/unix.cma ../util/util.cma ../matrix/matrix.cma ../readwrite/readwrite.cma ../infinitesimal/infinitesimal.cma ../draw/draw.cma ../widget/widget.cma analogic.cma ferdinand_bytecode.ml

ocamlopt.opt -linkall -o ferdinand -I ../util -I ../matrix -I ../readwrite -I ../infinitesimal -I ../draw -I ../widget $1/ocaml/graphics.cmxa $1/ocaml/nums.cmxa $1/ocaml/str.cmxa $1/ocaml/unix.cmxa ../util/util.cmxa ../matrix/matrix.cmxa ../readwrite/readwrite.cmxa ../infinitesimal/infinitesimal.cmxa ../draw/draw.cmxa ../widget/widget.cmxa analogic.cmxa ferdinand_native.ml

exit 0

