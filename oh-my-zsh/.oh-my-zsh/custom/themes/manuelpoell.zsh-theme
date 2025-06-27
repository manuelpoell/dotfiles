# Prompt: username + current directory + git info
PROMPT='%{$fg[magenta]%}%n@%m %{$fg[cyan]%}%~%{$fg[yellow]%}$(git_prompt_info)%{$reset_color%} $ '

# Git prompt format
ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" *"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Use nanosecond precision timers
preexec() {
  timer_start=$(date +%s%N)
}

precmd() {
  local exit_code=$?

  if [[ -n "$timer_start" ]]; then
    local timer_end=$(date +%s%N)
    local elapsed_ns=$((timer_end - timer_start))
    local elapsed_ms=$((elapsed_ns / 1000000))

    if [[ $elapsed_ms -ge 1000 ]]; then
      local elapsed_sec=$(awk "BEGIN { printf \"%.1f\", $elapsed_ms / 1000 }")
      duration_display="${elapsed_sec}s"
    else
      duration_display="${elapsed_ms}ms"
    fi
  else
    duration_display=""
  fi

  if [[ $exit_code -ne 0 ]]; then
    RPROMPT="%{$fg[red]%}[$exit_code] %{$fg[magenta]%}[$duration_display]%{$reset_color%}"
  elif [[ -n "$duration_display" ]]; then
    RPROMPT="%{$fg[magenta]%}[$duration_display]%{$reset_color%}"
  else
    RPROMPT=""
  fi

  unset timer_start
}

