# nvim

官网： https://neovim.io/

插件搜索： https://dotfyle.com/neovim/plugins/trending?page=1&q=tree

## Install

下载配置

```bash
git clone https://github.com/SuperJourney/nvim.git ~/.config/nvim

```

### 安装 fd

如果是 macos ，需要安装 fd 支持fzf 搜索

```bash
brew install fd
```

### 开启lsp



### UnInstall

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```


## Plugins

## Keyboard

### new-tree

| KEY      | 命令               | 绑定                    | 插件     |
| -------- | ------------------ | ----------------------- | -------- |
| \        | 打开或关闭侧边栏   | Neotree toggle `<cr>` | neo-tree |
| .        | 设置当前目录为root |                         | neo-tree |
| `<br>` | 设置上层目录为root |                         |          |
|          |                    |                         |          |
|          |                    |                         |          |

### kylechui/nvim-surround

| Old Text                                             | Command              | New Text                       |
| ---------------------------------------------------- | -------------------- | ------------------------------ |
| `surr*ound_words`                                  | `ysiw)`            | `(surround_words)`           |
| `*make strings`                                    | `ys$"`             | `"make strings"`             |
| `[delete ar*ound me!]`                             | `ds]`              | `delete around me!`          |
| `remove<b>````````HTML t*ags ``````</b>````````` | `dst`              | `remove HTML tags`           |
| `'change quot*es'`                                 | `cs'"`             | `"change quotes"`            |
| `<b>`or tag* types `</b>`                        | `csth1<CR>```````` | `<h1>`or tag types `</h1>` |
| `delete(functi*on calls)`                          | `dsf`              | `function calls`             |

### ibhagwan/fzf-lua

| KEY       | 命令               | col3 |
| --------- | ------------------ | ---- |
| `<C-P>` | 搜索文件           |      |
| `<C-E>` | 搜索最近打开的文件 |      |
| `<C-F>` | 搜索文本           |      |
| :FzfLua   | 其他命令           |      |
