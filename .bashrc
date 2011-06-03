#console
alias ls='ls -lah -G'
alias v='mvim'
alias m='mvim'
#projects
alias conf='cd ~/workspace/__ims__/ims-conf'
alias mock='cd ~/workspace/__ims__/ims-mock'
alias wise='cd ~/workspace/__ims__/wise_client'
alias analytics='cd ~/workspace/__ims__/ims-analytics'
alias gbim='cd /Users/anselmo/workspace/__bim__/bim.grupolm.pt'
alias nest='cd /Users/anselmo/workspace/__bim__/nest.glm.dev'
alias tck='cd /Users/anselmo/workspace/prk_rep/tck_mrk_2'
alias sb='cd /Users/anselmo/Workspace/sandbox'
alias ws='cd /Users/anselmo/workspace'
alias spikes='cd /Users/anselmo/spikes'
alias report='cd /Users/anselmo/workspace/__rep_man__/report.lmge.pt'
alias wmb='cd /Users/anselmo/workspace/__wmb__/beta'
alias wma='cd /Users/anselmo/workspace/__wmb__/analytics_beta'
alias lmit='cd /Users/anselmo/workspace/__post__/dev/lmit.web'

alias mag='cd /Users/anselmo/dev/tortor/mag_manager'
alias dev='cd /Users/anselmo/dev/7hats'

# git
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gch='git checkout'
alias gsb='git show-branch'
alias gx='gitx --all'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
#rails
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest -rails'
alias tlog='tail -f log/development.log'
alias scaffold='script/generate nifty_scaffold'
alias migrate='rake db:migrate db:test:clone'
alias rst='touch tmp/restart.txt'
# commands starting with % for pasting from web
alias %=' '
alias pbc='pwd | pbcopy'
alias tailler="tail -f log/development.log;"
# ACTUAL CUSTOMIZATION OH NOES!
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}
grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(%s|${SINCE_LAST_COMMIT})"`
        echo ${GIT_PROMPT}
    fi
}

gdiff() { git diff $* | view -; }
gdc() { gdiff --cached $*; }
alias pygrep="grep --include='*.py' $*"
alias rbgrep="grep --include='*.rb' $*"

source ~/.bash/bin/git-completion.bash

PS1="\[\033[0;31m\]$(date +%H:%M): \w\[\033[0;34m\]\$(grb_git_prompt) \[\033[0;32m\]$ "

export JAVA_HOME=/Library/Java/Home
export CATALINA_HOME=/Library/Tomcat/Home

alias upow="launchctl unload '$HOME/Library/LaunchAgents/cx.pow.powd.plist'"
alias rpow="launchctl load '$HOME/Library/LaunchAgents/cx.pow.powd.plist'"

