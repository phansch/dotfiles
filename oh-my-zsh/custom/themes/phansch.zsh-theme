local return_code="%(?..%{$fg[red]%}↳ %?%{$reset_color%})"

local time='%T'
local current_dir='%{$fg[blue]%}%{$terminfo[bold]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${return_code}
%{$fg[blue]%}%B#%b ${time} in ${current_dir} on ${git_branch}
%{$fg[green]%}%B$%b%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
