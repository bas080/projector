if [ -z "$(type -t project-cd)" ]; then
    project-cd() {
        cd $@
        test -f .bash_project && source .bash_project
    }
fi

alias cd='project-cd'
