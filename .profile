ora()
{
        export ORACLE_BASE=/tools/oracle

        if [ -z "$1" ]
        then
                echo "Nao especificado versao do Oracle!"
                return
        fi
        if [ "$1" = 9 ]
        then
                export ORACLE_SID=D00DB5;
                export ORACLE_HOME=$ORACLE_BASE/9.2.0;
        elif [ "$1" = 11 ]
        then
                export ORACLE_SID=D05DB11;
                export ORACLE_HOME=$ORACLE_BASE/11.1.0;
        else
                echo "Erro na versao do Oracle escolhida!"
                return
        fi

        export PATH=$ORACLE_HOME/bin:$PATH
        export LD_LIBRARY_PATH=$ORACLE_HOME/lib
        export SHLIB_PATH=$ORACLE_HOME/lib

        export ORA_NLS=$ORACLE_HOME/ocommon/nls/admin/data
        export ORA_NLS33=$ORACLE_HOME/ocommon/nls/admin/data

        export PS1="`echo $ORACLE_HOME|cut -f 4 -d '/'`|`whoami`@`hostname`"':$PWD> '
}

# =======================================================================================
# CONFIGURACAO DO TERMINAL

if [ "$TERM" = "" ]
then
        eval ` tset -s -Q -m ':?hp' `
else
        eval ` tset -s -Q `
fi
stty erase "^H" kill "^U" intr "^C" eof "^D"
stty hupcl ixon ixoff
tabs

PATH=~/mybin/:/COBILLING/APLICATIVOS/bin:$PATH

umask u=rwx,g=rwx,o=

mesg y

set -u
set -o vi
trap "echo 'logout'" 0

# =======================================================================================
# VARIAVEIS DE AMBIENTE

export EDITOR=vi

# =======================================================================================
# ALIAS

alias vim='vim -p'
alias edit='vim -p *.c *.pc *.h'
alias lt='ls -laFtr'
alias ls="ls --color -s -h -F -b -T 0"
alias ll="ls -l"
alias la="ls -a"
alias l="ls -la"

alias odes2='sqlplus GTASCCC_DES2/ora8ides2@D00DB5'
alias otes1='sqlplus GTASCCC_TES1/ora8ites1@D00DB5'

# =======================================================================================
# FUNCOES

limpaM()
{
 sed 's//g' $1 > $1_LIMPAM_TMP
        mv $1_LIMPAM_TMP $1
}

# =======================================================================================
# DATABASE

clear
while true
do
        echo "Qual versao do Oracle? [9/11]"
#        read OracleVersion
		  export OracleVersion=11
        case "$OracleVersion"
        in
                9)
                        ora 9
                        break
;;

                11)
                        ora 11
                        break
                        ;;

                *)
                        echo "Opcao invalida! Somente 9 ou 11"
                        ;;
        esac
done

grant_perms.sh /COBILLING/APLICATIVOS &
cd /COBILLING/PROJETO
