#######################################
# Normal commit, but adding -s to include your signature.
# Arguments:
#   text : commit text
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
gitcommit () {

        if [ $# -eq 0 ]; then
            echo "Please enter a commit message:";
            read msg;
            commit "$msg";
        elif [[ $1 == --help ]] || [[ $1 == --h ]] || [[ $1 == --? ]]; then
            echo "This will commit changes to a local git repo, eg:";
            echo "$ commit 'some changes made'";
            echo "This will do: git commit -s -m 'some changes made'";
        else    
            echo git commit -s -a -m "$1"
            git commit -s -a -m "$1";
        fi
  
  return 0

}
