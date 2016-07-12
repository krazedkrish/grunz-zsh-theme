# GRUNZ - created by krazedkrish
# Initially hacked from the Crunch theme. Thanks, by Steve Eley.
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine, 
# and eschews the standard space-consuming user and hostname info.  Instead, only the 
# things that vary in my own workflow are shown:
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
# 
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

GRUNZ_BRACKET_COLOR="%{$fg[white]%}"
GRUNZ_TIME_COLOR="%{$fg[yellow]%}"
GRUNZ_RVM_COLOR="%{$fg[magenta]%}"
GRUNZ_DIR_COLOR="%{$fg[cyan]%}"
GRUNZ_GIT_BRANCH_COLOR="%{$fg[green]%}"
GRUNZ_GIT_CLEAN_COLOR="%{$fg[green]%}"
GRUNZ_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$GRUNZ_BRACKET_COLOR:$GRUNZ_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $GRUNZ_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GRUNZ_GIT_DIRTY_COLOR✗"

# Our elements:
GRUNZ_TIME_="$GRUNZ_BRACKET_COLOR{$GRUNZ_TIME_COLOR%T$GRUNZ_BRACKET_COLOR}%{$reset_color%}"
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  GRUNZ_RVM_="$GRUNZ_BRACKET_COLOR"["$GRUNZ_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$GRUNZ_BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    GRUNZ_RVM_="$GRUNZ_BRACKET_COLOR"["$GRUNZ_RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$GRUNZ_BRACKET_COLOR"]"%{$reset_color%}"
  fi
fi
GRUNZ_DIR_="$GRUNZ_DIR_COLOR%~\$(git_prompt_info) "
GRUNZ_PROMPT="$GRUNZ_BRACKET_COLOR➭ "

# Put it all together!
PROMPT="$GRUNZ_TIME_$GRUNZ_RVM_$GRUNZ_DIR_$GRUNZ_PROMPT%{$reset_color%}"

#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
#PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}✚%F{black}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{blue}✹%F{black}"
ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}✖%F{black}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{yellow}✭%F{black}"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" -/-"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"

RPROMPT='%{$reset_color%}$(git_prompt_status)%{$reset_color%}'
