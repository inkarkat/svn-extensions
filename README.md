# Subversion CLI extensions

These are some personal aliases, shortcuts, and extensions that make (my) work with the [Subversion version control tool](https://subversion.apache.org/) easier and faster. Some of them may be specific to my environment and workflow, but maybe someone finds a valuable nugget in there.

### Installation

Download all / some selected extensions (note that some have dependencies, though) and put them somewhere in your `PATH`. You can then invoke them via `svn-SUBCOMMAND`.

Optionally, use the following (Bash) shell function (e.g. in your `.bashrc`) to transparently invoke the extensions in the same way as the built-in kubectl commands, via `svn SUBCOMMAND`:

    # Allow definition of Subversion aliases (e.g. "svn foo") by putting an
    # executable "svn-foo" somewhere in the PATH.
    svn() {
        typeset -r svnAlias="svn-$1"
        if [ $# -eq 0 ]; then
            svn ${SVN_DEFAULT_COMMAND:-st}
        elif type -t "$svnAlias" >/dev/null; then
            shift
            eval $svnAlias '"$@"'
        else
            command svn "$@"
        fi
    }
