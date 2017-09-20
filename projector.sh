if [ -z "$(type -t project-cd)" ]; then
    project-cd() {
        cd $@
        test -f .bash_project && source .bash_project && PROJECT_HOME="$PWD"
    }
fi

alias cd='project-cd'
