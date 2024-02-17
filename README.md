如果无法在线浏览Web文件，请看[[这个issue]](https://github.com/turbio/bracey.vim/issues/21#issuecomment-656995422)

    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls

关于emmet-vim的使用教程请参考其[[官方手册]](https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL)


# Markdown

## 导航
- `]]`：跳转到下一个标题。
- `[[`：跳转到上一个标题。
- `][`：跳转到下一个同级标题。
- `[]`：跳转到上一个同级标题。
- `]c`：跳转到下一个代码块。
- `[c`：跳转到上一个代码块。

## 折叠
- `zc`：折叠当前部分。
- `zo`：展开当前部分。
- `za`：切换当前部分的折叠/展开状态。
- `zR`：展开所有折叠。
- `zM`：折叠所有部分至最高级标题。

## 列表操作
- `o` 或 `O` 在列表项中：自动插入新的列表项。
- `dd` 在列表项中：删除列表项，并修正后续列表项的编号。

## 链接跳转
- 在链接上使用 `gx`：打开链接。这是 Vim/Neovim 的通用快捷键，而不是 vim-markdown 特有的。

## 创建标题
- `:InsertToc`：在光标位置插入一个基于当前文档标题的目录。这需要手动添加并不是通过快捷键完成。

## 其他
- 还有一些特定的功能和快捷键可能会依赖于你的具体配置，以及 vim-markdown 插件是否与其他插件（如折叠管理插件）集成。

## 注意
- 快捷键的可用性可能受到个人 Vim/Neovim 配置的影响，特别是如果你有自定义映射或使用了其他可能与 vim-markdown 冲突的插件。
- vim-markdown 的默认配置和行为可能会随版本更新而变化，因此建议查阅最新的官方文档或通过 `:help markdown` 命令在 Vim/Neovim 中访问插件帮助文档获取最准确的信息。
