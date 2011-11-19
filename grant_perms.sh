#!/bin/sh

# How to use:
# grant_perms.sh DIR
# Will chmod +x every folder within DIR, including DIR itself

echo Dando permissao de execucao e leitura para todas as subpastas de $1
for x in $(find $1 -type d)
do
#echo $x
chmod a+rx $x
done
