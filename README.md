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
