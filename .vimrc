"---文字エンコーディング設定---
set encoding=utf-8

"---クリップボード設定---
set guioptions=a
set clipboard=unnamed,autoselect

"---表示設定---
set number          "行番号を表示
set title           "編集中のファイル名を表示
set showmatch       "括弧入力時の対応する括弧を表示
syntax on           "コードの色分け
set cursorline      "カーソル行の背景色を変える
set laststatus=2    "ステータス行を常に表示
set list            "不可視文字の可視化, 下行が表示文字指定
set listchars=tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%

"---全角スペース表示設定
function! TwoByteSpace()
    highlight TwoByteSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup TwoByteSpaceSpace
        autocmd!
        autocmd ColorScheme       * call TwoByteSpace()
        autocmd VimEnter,WinEnter * match TwoByteSpace /　/
    augroup END
    call TwoByteSpace()
endif

"---検索設定---
set ignorecase      "大文字/小文字の区別なく検索する
set smartcase       "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan        "検索時に最後まで行ったら最初に戻る

"---ファイル処理設定---
set hidden          "保存されていないファイルがあるときでも別のファイルを開くことができる
set confirm         "保存されていないファイルがあるときは終了前に保存確認
set autoread        "外部でファイルに変更があった場合は読み直す
set nobackup        "ファイル保存時にバックアップファイルを作らない
set noswapfile      "ファイル編集中にスワップファイルを作らない
set undofile        "undoファイルを生成するように指定
set undodir=$HOME/.vim/undo "undoファイルの生成ディレクトリを指定
set tags=tags;     "tagファイルをカレントディレクトリから親ディレクトリも辿るように設定

"---検索/置換の設定
set hlsearch        "検索文字列をハイライトする
set incsearch       "インクリメンタルサーチを行う
set ignorecase      "大文字と小文字を区別しない
set smartcase       "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan        "最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault        "置換の時 g オプションをデフォルトで有効にする

"---タブ/インデントの設定---
set tabstop=4       "インデントをスペース4つ分に固定
set smartindent     "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set autoindent      "改行時に前の行のインデントを継続する
set shiftwidth=4    "自動インデントでずれる幅
set expandtab       "tabの代わりに空白文字を指定

"---動作環境の設定---
set mouse=a         "マウスの入力を受け付ける
set backspace=indent,eol,start "バックスペースでインデントや改行を削除
set completeopt=menuone
inoremap <C-Space> <C-n><C-p>
inoremap {<CR> {<CR>}<Esc><S-o>
inoremap { {<CR>}<Esc><S-o>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap /* /**/<Left><Left>
inoremap <silent> jj <ESC>  "jjでインサートからノーマルへ
