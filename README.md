# fish_utils
fish のちょっと便利関数とか置いとく所
上げといてまだ使ったことないスクリプトとかあるのであくまで自己責任で！

## 使い方
fish shell をインストールする
```sh
$ brew install fish
```

fish shell をデフォルトにする（したくないならしなくていいと思います）
```sh
$ echo /usr/local/bin/fish | sudo tee -a /etc/shells
$ chsh -s /usr/local/bin/fish
```

zsh から fish に切り替える
```sh
$ fish
```

## 設定ファイル
~/.config/fish/config.fish
だいたいこれをいじることになるので code コマンドか open コマンドで開いてください。
vim とかで開いてもいいですが、fish の設定ファイルは色々特殊なので、code か open で開いたほうがいいと思います。

```sh
$ code ~/.config/fish/config.fish
or
$ vim ~/.config/fish/config.fish
or
$ open ~/.config/fish/
→ config.fish を開く
```
