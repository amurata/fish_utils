# 基本的な設定
## PATH
set PATH \
  /usr/local/bin \
  /usr/sbin \
  $HOME/bin \
  /opt/homebrew/bin/ \
$PATH

### fish の設定
# fishのキーバインドをvi風に
#fish_vi_key_bindings
# プロンプトにviのモードを表記
set -g theme_display_vi yes

# 日本語表記にする
set -gx LC_TIME ja_JP.UTF-8

# 日付を表示
set -g theme_display_date yes
set -g theme_date_format "+%F %a %H:%M"

# masterでもブランチ名を表示
set -g theme_display_git_master_branch yes

# コマンドの実行時間を表示
set -g theme_display_cmd_duration yes

# shellのタイトルバー表示をカスタマイズ
set -g theme_title_display_user no
set -g theme_title_display_process yes
set -g theme_title_display_path no

# exitステータスを表示
set -g theme_show_exit_status yes

# カーソルは■▶の次の行。プロンプトの頭は$。ディレクトリ名は省略表示しない（0）
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g fish_prompt_pwd_dir_length 0

