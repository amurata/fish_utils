# fish_utils
fish のちょっと便利関数とか置いとく所
上げといてまだ使ったことないスクリプトとかあるのであくまで自己責任で！

## 使い方
fish shell をインストールする
```sh
brew install fish
```

fish shell をデフォルトにする（このfunctionsを使用するには fish を使用する必要があります）
```sh
echo /usr/local/bin/fish | sudo tee -a /etc/shells
```
```sh
chsh -s /usr/local/bin/fish
```

zsh から fish に切り替える
```sh
fish
```

## 設定ファイル
~/.config/fish/config.fish
だいたいこれをいじることになるので code コマンドか open コマンドで開いてください。
vim とかで開いてもいいですが、fish の設定ファイルは色々特殊なので、code か open で開いたほうがいいと思います。

```sh
code ~/.config/fish/config.fish
```

```sh
vim ~/.config/fish/config.fish
```

```sh
open ~/.config/fish/
```
→ config.fish を開く

## functions の適用について
Fish シェルでは、関数を config.fish ファイルに直接書く代わりに、関数を個別のファイルに保存し、それを config.fish から読み込む（sourceする）ことができます。これにより、設定を整理しやすくなり、再利用性が向上します。

関数を個別のファイルに保存するには、.config/fish/functions ディレクトリを使用します。
このディレクトリに保存されたファイルは、ファイル名が関数名になります。
例えば、 hogehoge 関数を hogehoge.fish というファイルに保存することができます。

通常では、 `~/.config/fish/functions`` ディレクトリに保存された関数は、Fish シェルが自動的に読み込むため、source コマンドを使う必要はありません。
config.fish から明示的にその関数を読み込むには、source コマンドを使用します。
