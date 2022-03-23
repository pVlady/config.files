" Меню для выбора кодировки текста
menu Codetable.UTF-8 :e ++enc=utf8 <CR>
menu Codetable.Win-1251 :e ++enc=cp1251 <CR>
menu Codetable.KOI8-r :e ++enc=koi8-r <CR>
menu Codetable.cp866 :e ++enc=cp866 <CR>
set guioptions-=T
" set showtabline=0           " отключить показ строки вкладок

" Настройка клавиатуры
set keymap=russian-jcukenwin  " переключение раскладки <Ctrl-^>
set iminsert=0                " при запуске выбрать англ. язык
set imsearch=0                " настройка режими поиска

" Установить английский язык интерфейса (первая строка в файле)
set langmenu=en_US.UTF-8
set encoding=utf8
set nocompatible
set wrap linebreak nolist     " переность строку по словам (nowrap, wrap)

" Файловые настройки
set autochdir      " делать рабочей папкой директорию открытого файла
set nobackup       " не создавать файл бэкапа для редактируемого файла
set nowritebackup  " ???
set noswapfile     " не создавать файлы свопа в рабочей директориavZ3*z%Mи
set fileformat=dos

set runtimepath^=~\.vim

call plug#begin()  "('~\.vim\plugin')
Plug 'itchyny/lightline.vim'
Plug 'lyokha/vim-xkbswitch'
Plug 'matze/vim-move'                " перемещение текущей или выделеной грурры строк
Plug 'junegunn/goyo.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-syntastic/syntastic'        " проверка синтаксиса
Plug 'vimwiki/vimwiki'

Plug 'nvie/vim-flake8'                " проверка на соответствие PEP8
Plug 'Vimjas/vim-python-pep8-indent'  " небольшой плагин для установки отсупов в python
Plug 'tpope/vim-commentary'           " комментирование кода (gcc строку, gcap абзац, gc в Visual Mode выделение)
Plug 'dense-analysis/ale'             " asynchronous lint engine 
Plug 'thinca/vim-quickrun'            " запуск текущего файла из Vim и просмотр результатов
" Plug 'vim-scripts/indentpython.vim'   " улучшает autoindent в Python

Plug 'kien/ctrlp.vim'                 " super searching (use Ctrl-P)
Plug 'elzr/vim-json'                  " json support
Plug 'junegunn/fzf'
Plug 'yegappan/mru'                   " most recently used files
" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Plug 'scrooloose/nerdtree'            " панель файлов
" Plug 'jistr/vim-nerdtree-tabs'        " работа с вкладками в NerdTree
" Plug 'Valloric/YouCompleteMe'         " autocomplete в Python
" Plug 'SirVer/ultisnips'               " snippets в vim
" Plug 'nvie/vim-flake8'
" Plug 'Plugin dbext.vim'               " SQL support
call plug#end()

" ===========================================================================================
" Настройка плагинов
let XkbSwitchEnabled=1                       " vim-xkbswitch: включить поддержку xkbswitch
let g:move_key_modifier='C'                  " vim-move:      перемещать строки <C-j>, <C-k>, ... вместо <A-j>, <A-k>, ...
let g:syntastic_always_populate_loc_list = 1 " syntastic:
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:vimwiki_list=[
      \  {'path': 'D:\Data\Clouds\Dropbox\.sync\.vimwiki\pvlady.wiki',
      \   'syntax': 'markdown'},
      \  {'path': 'D:\Data\Clouds\Dropbox\.sync\.vimwiki\more.wiki',    
      \   'syntax': 'markdown'}
      \ ]
let g:ale_linters = {
      \   'python': ['flake8', 'pylint']
      \ }

au BufRead,BufNewFile *.wiki set filetype=vimwiki
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

" let NERDTreeAutoDeleteBuffer = 1             " nerdtree:      автообновление буфера после переименования файла
" let g:UltiSnipsExpandTrigger="<tab>"         " ultisnips:     
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"          " if you want :UltiSnipsEdit to split your window.
"
set laststatus=2
set noshowmode

" Размеры окна редактора по умолчанию
set lines=46
set columns=150

" Включить нумерацию строк, подсветку синтаксиса и текущей строки
set number
syntax enable
set cursorline
filetype plugin indent on

" Настройка табуляции, отступов и фолдинго
set tabstop=2         " число пробелов в Tab'е
set expandtab         " заменять Tab на пробелы
set softtabstop=2     " число пробелов при удалении
set smarttab          " вставляет shiftwidth пробелов при нажатии Tab в начале строки
set shiftwidth=2
set autoindent        " автоматическая расстановка отступов
set textwidth=120
set foldenable        " включить сворачивание блоков текста
set foldmethod=indent " сворачивание блоков по отступам (indent|syntax|manual|marker|diff)
set foldlevel=99
set foldopen=all      " автоматически раскрывать блок при вхождении в него курсора
nnoremap <space> za   " сворачивать/раскрывать блоки пробелом
filetype indent on
filetype plugin on

" Поддержка мыши во всех режимах
set mouse=a        " n(normal); v(visual); i(insert); c(command line); a(n+v+i+c); r(input mode)

" Задать цветовую схему редактора
colorscheme OceanicNext

" Задать семейство и размер шрифта редактора
set guifont=Meslo\ LG\ S:h10

" Задать кодировки для автоопределения при открытии файла
set fileencoding=cp1251.utf8

" Задать символы, воспринимаемые как буквы
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255

" Настройка поиска
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set ic            " по умолчанию использовать регистронезависимый поиск
highlight TrailingWhitespace ctermbg=red guibg=red  " выделять конечные пробелы красным
match TrailingWhitespace /\s\+\%#\@<!$/

" ==========================
" Настройки типов файлов ===
" ==========================
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/          " выделять табуляторы в начале строки в файлах Python
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/  " выделять конечные пробелы 
highlight BadWhitespace ctermbg=red guibg=red

" Настройка файлов Python
au BufNewFile,BufRead *.py
  \ set textwidth=79
  \ set tabstop=4         " число пробелов в Tab'е
  \ set softtabstop=4     " число пробелов при удалении
  \ set shiftwidth=4
  \ set expandtab         " заменять Tab на пробелы
  \ set autoindent
  \ set fileformat=unix
let python_highlight_all=1            " full syntax highlighting
let NERDTreeIgnore=['\.pyc$', '\~$']  " скрывать файлы указанных типов в NerdTree

" Настройка markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown set cursorline
autocmd FileType markdown set conceallevel=2
" autocmd FileType markdown setlocal spell spelllang=en_GB,ru_RU
autocmd FileType markdown Goyo

command Erc edit $MYVIMRC
command TT edit ~\.vim\tutor.vim

" Настройки клавиатуры для редактирования текста
set backspace=indent,eol,start
" - ввод парных элементов
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
imap < <><LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

inoremap <C-space> <C-x><C-o>   " Ctrl + пробел для автодополнения
nmap <C-w> :bd<CR>              " Ctrl + W для закрытия буфера в norman mode
imap <C-w> <ESC> :bd<CR>        " Ctrl + W для закрытия буфера в режиме вставки
nnoremap <C-g> :Goyo<CR>        " двойное нажатие Ctrl-G выходит из Goyo
nnoremap <CR> :noh<CR>          " сбрасывать выделение последнего поиска по Enter

" - копирование и всвтавка из буфера обмена
" vnoremap <C-c> "*y
vmap <C-c> "*yi
vmap <C-x> "*c
vmap <C-v> c<ESC>"*p
imap <C-v> <ESC>"*pa

"========================================================================>
" Настройка плагина SimplyFold (to see the docstring for folded code)
let g:SimpylFold_docstring_preview=1

" Настройка плагина YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"========================================================================>
" Настройка плагина lightline
" - установка tabline
let g:lightline = {}
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " показать tabline
set guioptions-=e  " не отображать GUI tabline

let g:lightline = {
  \   'separator': {'left': ':', 'right': '|'},
  \   'subseparator': {'left': '|', 'right': ':'}
  \ }

"let g:lightline.active = { 
"  \ 'left': [ [ 'mode', 'paste' ],
"  \         [ 'readonly', 'filename', 'modified' ] ],
"  \ 'right': [ [ 'lineinfo' ],
"  \          [ 'percent' ], 
"  \          [ 'fileformat', 'fileencoding', 'filetype' ] ] }

" Настройка markdown
let g:vim_markdown_conceal=2
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_math=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_strikethrough=1
let g:vim_markdown_autowrite=1
let g:vim_markdown_edit_url_in='tab'
let g:vim_markdown_follow_anchor=1       " позволяет создавать ссылки внутри документа и переключаться между ними
