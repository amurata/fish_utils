
set description_default "# チケットの番号\n\n# 動作確認..." # default を表す内容
set description_server "server side description..."  # server を表す内容
set description_other "other..."   # other を表す内容

function git_push
    # デフォルトの内容を設定します
    set description $description_default

    # 引数を処理します
    for arg in $argv
        switch $arg
            case 'd'
                set description $description_default
            case 's'
                set description $description_server
            case 't'
                set description $description_other
            case '*'
                # git push のオプションを保存します
                set git_args $git_args $arg
        end
    end

    # 現在のブランチ名を取得します
    set current_branch (git rev-parse --abbrev-ref HEAD)

    # ブランチ名が master または protected で始まる場合はエラーメッセージを表示します
    if test $current_branch = 'master' -o (string match -r '^protected' $current_branch)
        echo "エラー: master ブランチまたは protected プレフィックスが付いたブランチには push できません。"
        return 1
    end

    # git push コマンドを実行します
    git push $git_args

    # 最後のコミットメッセージを取得します
    set last_commit_msg (git log -1 --pretty=%B)

    # タイトルとして使用するためにコミットメッセージをURLエンコードします
    set encoded_title (string escape --style=url "$last_commit_msg")

    # 内容をURLエンコードします
    set encoded_description (string escape --style=url "$description")

    # 新しいマージリクエストのページへのURLを生成して表示します
    echo "https://gitlab.com/<your_project_path>/merge_requests/new?merge_request%5Bsource_branch%5D=$current_branch&merge_request%5Btitle%5D=$encoded_title&merge_request%5Bdescription%5D=$encoded_description"
end
