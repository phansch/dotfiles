local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local time='%T'
local current_dir='%{$terminfo[bold]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${return_code}

${time} in ${current_dir} ${git_branch}
%B$%b "

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
