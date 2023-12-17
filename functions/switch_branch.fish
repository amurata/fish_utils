function switch_branch
    # ブランチの一覧を取得し、fzf で選択させます
    set selected_branch (git for-each-ref --format='%(refname:short)' refs/heads/ | fzf)

    # ユーザーが選択したブランチに切り替えます
    if test -n "$selected_branch"
        git checkout $selected_branch
    end
end
