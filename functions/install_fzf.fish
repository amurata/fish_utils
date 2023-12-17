# switch_branch のために fzf をインストールする関数だけど、これを入れてたら毎回fish立ち上げるたびにチェックされるので、不要ならconfig.fishから削除する。
function install_fzf
    if not type -q fzf
        echo "fzf がインストールされていません。インストールしますか？ [Y/n]"
        read -l confirm
        if test "$confirm" = "Y" -o "$confirm" = "y"
            if not type -q brew
                echo "Homebrew がインストールされていません。fzf のインストールには Homebrew が必要です。Homebrew をインストールしますか？ [Y/n]"
                read -l confirm
                if test "$confirm" = "Y" -o "$confirm" = "y"
                    echo "Homebrew のインストールを開始します。"
                    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                else
                    echo "Homebrew のインストールをスキップします。fzf のインストールは中止されます。"
                    return
                end
            end
            echo "fzf のインストールを開始します。"
            brew install fzf
            echo "fzf のセットアップを開始します。"
            /usr/local/opt/fzf/install
        end
    end
end

install_fzf
