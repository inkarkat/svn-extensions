#!/bin/sh source-this-script

# Allow definition of Subversion aliases (e.g. "svn foo") by putting an
# executable "svn-foo" somewhere in the PATH.
svn()
{
    typeset svnAlias="svn-$1"
    if [ $# -eq 0 ]; then
	command svn ${SVN_DEFAULT_COMMAND:-st}
    elif type ${BASH_VERSION:+-t} "$svnAlias" >/dev/null 2>&1; then
	shift
	eval $svnAlias '"$@"'
    else
	command svn "$@"
    fi
}
