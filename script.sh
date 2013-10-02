#!/bin/sh
#@(#)Making calculation modules for Ocaml.
#@(#)Copyright Stéphane Grognet 2012
#@(#)Laboratoire de mathématiques Jean Leray UMR 6629 CNRS
#@(#)Fédération de recherche mathématique des Pays de la Loire
#@(#)IREM des Pays de la Loire - Université de Nantes
#@(#)version 0.4

##########################
# Cleaning the directory #
##########################

echo "-> Cleaning the directory"

if ( ! test -e MathSpec )
 then
  ( mkdir MathSpec )
 else
  ( rm -r MathSpec ; mkdir MathSpec )
fi

if ( ! test -e GraphicmathSpec )
 then
  ( mkdir GraphicmathSpec )
 else
  ( rm -r GraphicmathSpec ; mkdir GraphicmathSpec )
fi

if ( ! test -e util )
 then
  ( mkdir util )
 else
  ( rm -r util ; mkdir util )
fi

if ( ! test -e data )
 then
  ( mkdir data )
 else
  ( rm -r data ; mkdir data )
fi

if ( ! test -e sparse )
 then
  ( mkdir sparse )
 else
  ( rm -r sparse ; mkdir sparse )
fi

if ( ! test -e matrix )
 then
  ( mkdir matrix )
 else
  ( rm -r matrix ; mkdir matrix )
fi

if ( ! test -e trans )
 then
  ( mkdir trans )
 else
  ( rm -r trans ; mkdir trans )
fi

if ( ! test -e infinitesimal )
 then
  ( mkdir infinitesimal )
 else
  ( rm -r infinitesimal ; mkdir infinitesimal )
fi

if ( ! test -e sci )
 then
  ( mkdir sci )
 else
  ( rm -r sci ; mkdir sci )
fi

if ( ! test -e reduc )
 then
  ( mkdir reduc )
 else
  ( rm -r reduc ; mkdir reduc )
fi

if ( ! test -e readwrite )
 then
  ( mkdir readwrite )
 else
  ( rm -r readwrite ; mkdir readwrite )
fi

if ( ! test -e graphicmath )
 then
  ( mkdir graphicmath )
 else
  ( rm -r graphicmath ; mkdir graphicmath )
fi

if ( ! test -e draw )
 then
  ( mkdir draw )
 else
  ( rm -r draw ; mkdir draw )
fi

if ( ! test -e widget )
 then
  ( mkdir widget )
 else
  ( rm -r widget ; mkdir widget )
fi

if ( ! test -e analogic )
 then
  ( mkdir analogic )
 else
  ( rm -r analogic ; mkdir analogic )
fi

if ( ! test -e spec )
 then
  ( mkdir spec )
 else
  ( rm -r spec ; mkdir spec )
fi

#########################
# Making the souce tree #
#########################

echo "-> Making the souce tree"

cat ../util/util.ml ../util/bary.ml ../util/deg.ml ../data/data.ml ../sparse/hash.ml ../sparse/sparse_vector.ml ../sparse/sparse_tensor.ml ../sparse/sparse_matrix.ml ../matrix/mat.ml ../matrix/matrix.ml ../trans/fft.ml ../readwrite/readwrite.ml ../infinitesimal/infinitesimal.ml ../sci/sci.ml ../reduc/reduc.ml ../data/data2.ml > math.ml

cat math.ml > graphicmath/graphicmath.ml

cat ../draw/draw.ml ../widget/widget.ml ../analogic/analogic.ml ../spec/spec.ml >> graphicmath/graphicmath.ml

cp ../util/util.ml util &
cp ../util/bary.ml util &
cp ../util/test.ml util/test_util.ml &
cp ../util/essai.ml util/test_bary.ml &
cp ../util/deg.ml util/ &
cp ../util/test_deg.ml util/test_deg.ml &
cp ../data/data.ml data &
cp ../data/data2.ml data &
cp ../sparse/hash.ml sparse/ &
cp ../sparse/sparse_vector.ml sparse/ &
cp ../sparse/sparse_tensor.ml sparse/ &
cp ../sparse/sparse_matrix.ml sparse/ &
cp ../sparse/test.ml sparse/test_sparse.ml &
cp ../matrix/mat.ml matrix/ &
cp ../matrix/matrix.ml matrix/ &
cp ../matrix/test.ml matrix/test_matrix.ml &
cp ../matrix/test_mat.ml matrix/test_mat.ml &
cp ../trans/fft.ml trans/ &
cp ../trans/test.ml trans/test_fft.ml &
cp ../infinitesimal/infinitesimal.ml infinitesimal/ &
cp ../infinitesimal/test.ml infinitesimal/test_infinitesimal.ml &
cp ../sci/sci.ml sci/ &
cp ../sci/test.ml sci/test_sci.ml &
cp ../reduc/reduc.ml reduc/ &
cp ../reduc/test.ml reduc/test_reduc.ml &
cp ../readwrite/readwrite.ml readwrite/ &
cp ../readwrite/test.ml readwrite/test_readwrite.ml &
cp ../readwrite/essai.xpm readwrite/ &
cp ../draw/draw.ml draw/ &
cp ../draw/test_a.ml draw/test_draw_a.ml &
cp ../draw/test_b.ml draw/test_draw_b.ml &
cp ../draw/test_c.ml draw/test_draw_c.ml &
cp ../draw/test_d.ml draw/test_draw_d.ml &
cp ../draw/test_a.ml graphicmath/test_draw_a.ml &
cp ../draw/test_b.ml graphicmath/test_draw_b.ml &
cp ../draw/test_c.ml graphicmath/test_draw_c.ml &
cp ../draw/test_d.ml graphicmath/test_draw_d.ml &
cp ../widget/widget.ml widget/ &
cp ../widget/test.ml widget/test_widget.ml &
cp ../widget/test.ml graphicmath/test_widget.ml &
cp ../analogic/analogic.ml analogic/ &
cp ../analogic/test.ml analogic/test_analogic.ml &
cp ../analogic/test.ml graphicmath/test_analogic.ml &
cp ../analogic/block_native.sh ../analogic/block_bytecode.sh ../analogic/build_ferdinand.sh ../analogic/fragment_native.sh ../analogic/fragment_bytecode.sh ../analogic/ferdinand_native.ml ../analogic/ferdinand_bytecode.ml analogic/ &
cp ../spec/spec.ml spec/ &
cp ../spec/test.ml spec/test_spec.ml &

###########################
# Making the dependencies #
###########################

echo "-> Making the dependencies"

echo "         Dependency list of the modules" > depend.txt
echo "+++ file generated by script.sh : do not edit directly +++" >> depend.txt
echo "----------------------------------------------------------" >> depend.txt
echo "util.ml          -> nums.cma, str.cma" >> depend.txt
echo "bary.ml          ->" >> depend.txt
echo "data.ml          -> nums.cma, str.cma, util.ml" >> depend.txt
echo "deg.ml           -> nums.cma" >> depend.txt
echo "hash.ml          -> nums.cma, str.cma, util.ml, bary.ml" >> depend.txt
echo "sparse_vector.ml -> nums.cma, str.cma, hash.ml" >> depend.txt
echo "sparse_tensor.ml -> data.ml, hash.ml, sparse_vector.ml" >> depend.txt
echo "sparse_matrix.ml -> sparse_vector.ml, sparse_tensor.ml" >> depend.txt
echo "mat.ml           -> util.ml, sparse_vector.ml, sparse_tensorr.ml, sparse_matrix.ml" >> depend.txt
echo "matrix.ml        -> str.cma, util.ml" >> depend.txt
echo "fft.ml           -> util.ml, sparse_vectorr.ml, sparse_matrix.ml, mat.ml" >> depend.txt
echo "infinitesimal.ml -> util.ml, matrix.ml" >> depend.txt
echo "sci.ml           -> nums.cma, str.cma, util.ml, hash.ml, data.ml" >> depend.txt
echo "reduc.ml         -> matrix.ml, sci.ml" >> depend.txt
echo "data2.ml         -> reduc.ml, sci.ml" >> depend.txt
echo "readwrite.ml     -> str.cma, matrix.ml" >> depend.txt
echo "math.ml          -> util.ml, bary.ml, data.ml, deg.ml, hash.ml, sparse_vector.ml, sparse_tensor.ml, sparse_matrix.ml, mat.ml, matrix.ml, infinitesimal.ml, sci.ml, reduc.ml, data2.ml, readwrite.ml" >> depend.txt

echo "draw.ml          -> graphics.cma, matrix.ml, infinitesimal.ml" >> depend.txt
echo "widget.ml        -> graphics.cma, util.ml, matrix.ml, readwrite.ml, infinitesimal.ml" >> depend.txt
echo "analogic.ml      -> graphics.cma, unix.cma, util.ml, matrix.ml, readwrite.ml, infinitesimal.ml, draw.ml, widget.ml" >> depend.txt
echo "spec.ml          -> str.cma, unix.cma, util.ml, data.ml, readwrite.ml, depend.defaults, depend.conf, hash.ml, sparse_vector.ml, sparse_tensor.ml, sparse_matrix.ml, GraphicmathSpec/*" >> depend.txt
echo "graphicmath.ml   -> math.ml, draw.ml, widget.ml, analogic.ml, spec.ml" >> depend.txt

#############################
# Making the specifications #
#############################

echo "-> Making the specifications"

ocamldoc.opt -v -html -d MathSpec -colorize-code -all-params -keep-code -intro foreword_math.ml math.ml &
ocamldoc.opt -v -html -d GraphicmathSpec -colorize-code -all-params -keep-code -intro foreword_graphicmath.ml graphicmath/graphicmath.ml ;

#################################
# Making the bytecode libraries #
#################################

echo "-> Making the bytecode libraries"

sh ./fragment_bytecode_lib.sh

sh ./block_bytecode_lib.sh

################################
# Making the bytecode software #
################################

echo "-> Making the bytecode software"

cd analogic
# sh block_bytecode.sh
sh fragment_bytecode.sh
cd ..

########################
# Making the toplevels #
########################

echo "-> Making the toplevels" ;

sh block_top.sh

########################################
# It is finished if no error occurred. #
########################################

echo "-> The end"

exit 0

