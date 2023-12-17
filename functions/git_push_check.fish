function git_push_check
    # 現在のブランチのアップストリームブランチを取得します
    set upstream_branch (git rev-parse --abbrev-ref --symbolic-full-name @{u})

    # 差分行数の閾値を設定。ここでは100行とする。
    set threshold 100

    # アップストリームブランチとの差分行数を計算
    set diff_stats (git diff --shortstat $upstream_branch...HEAD)

    # 追加された行数と削除された行数を取得します
    set added_lines (echo $diff_stats | awk '{print $4}')
    set deleted_lines (echo $diff_stats | awk '{print $6}')

    # 差分行数を表示します
    echo -n "差分行数: +$added_lines -$deleted_lines "

    # 差分行数の合計を計算します
    set total_diff (math "$added_lines + $deleted_lines")

    # 差分行数に基づいてメッセージを表示する。
    # NOTE: 差分行数のしきい値は追加行数分としておく。
    if test -z "$total_diff"
        echo "差分がありません。"
    else if test $added_lines -le $threshold
        set_color green
        echo "GOOD"
    else if test $added_lines -le (math "$threshold * 2")
        set_color yellow
        echo "OK"
    else
        set_color red
        echo "NG: 差分が大きすぎます。別チケットに切り出せないか検討してください。"
    end

    # 色をリセットします
    set_color normal
end
