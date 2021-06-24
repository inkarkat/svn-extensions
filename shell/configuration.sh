#!/bin/sh source-this-script

# Add svn completion extensions for file arguments:
# - Use 'svn status' for completion (e.g. of "add" and "revert").
# - Let the status also consider subdirectories, not just the CWD.
SVN_BASH_COMPL_EXT=svnstatus,recurse
