# In sway it is a bit tricky to find the id of the window to focus, so we rely on the fact (and this can be extremely brittle)
# that terminals running kakoune have a title ending with "$kak_client@[$kak_session] - Kakoune".
define-command sway-focus-impl -hidden -params 1 %{
    evaluate-commands -client %arg{1} %{
        nop %sh{
            query=$(printf '[title=".*%s@\\[%d\\] - Kakoune"] focus' "$kak_client" "$kak_session")
            echo "$query"
            swaymsg "$query"
        }
    }
}

define-command sway-focus -docstring '
sway-focus [<kakoune_client>]: focus a given client''s window
If no client is passed, then the current client is used' -client-completion -params ..1 %{
    evaluate-commands %sh{
        if [ $# -eq 1 ]; then
            printf "sway-focus-impl '%s'" "$1"
        else
            printf "sway-focus-impl '%s'" "$kak_client"
        fi
    }
}

alias global focus sway-focus
