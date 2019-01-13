" For NeoVim ony.
" export TMPDIR=/home/brent/ramDisk
"
set mouse=a
set backupcopy=yes 
set ruler number cursorline laststatus=2
set undofile undolevels=1000 
set modifiable signcolumn=yes
set nofoldenable foldmethod=syntax "za zr zm
set nowrapscan smartindent smartcase
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1,gbk

function! InitMapKeys()
    map <silent><S-A> <ESC>:set mouse=a<CR>
    map <silent><C-A> <ESC>:set mouse=v<CR>
    nmap <leader>q :q<CR>
    nmap <leader>w :w<CR>
    nmap <leader>M %
    nnoremap <silent>cn :cn<CR>
    nnoremap <silent>cp :cp<CR>
    nnoremap <silent>bn :bn<CR>
    nnoremap <silent>bp :bp<CR>
    nnoremap <silent>bd :bd<CR>
endfunction

function! UpdateUIColors()
    colorscheme neodark
    highlight BookmarkSign ctermbg=NONE ctermfg=160
    highlight BookmarkLine ctermbg=194 ctermfg=NONE
    highlight Pmenu    guifg=#D8D8D2 guibg=#121213 ctermbg=159 ctermfg=0
    highlight PmenuSel guibg=#0000ff guifg=#ffffff ctermbg=211 ctermfg=0 
endfunction

autocmd BufWritePost $MYVIMRC source $MYVIMRC
"==================================================================================================
let g:Coding_Files = ['asm', 'c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'py', 'sh']
let g:Coding_Roots = ['.root', '.svn', '.git' , 'compile_commands.json', 'find_all_symbols_db.yaml', '.clang-format']
    "==============================================================================================
call plug#begin(stdpath('config') . '/plugged')
    "==============================================================================================
Plug 'iosmanthus/vim-nasm'		        , {'for': ['asm'] }
Plug 'vim-scripts/a.vim'		        , {'for': g:Coding_Files }
Plug 'tpope/vim-commentary'             " gc, gcc / gcgc gcu
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'jreybert/vimagit'
Plug 'mbbill/undotree'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
    "==============================================================================================
Plug 'mileszs/ack.vim'  " strcp y
    let g:ackprg = 'ag --nogroup --column --vimgrep'
    nnoremap <leader>f  :lv /<c-r>=expand("<cword>")<cr>/ %<CR>:lw<CR>
    nnoremap <leader>ff :lv /<c-r>=expand("<cword>")<cr>/gj **/*.c **/*.C **/*.cc **/*.cxx ***.cp **/*.cpp **/*.h **/*.hpp <cr>:lw<cr>
    nnoremap <Leader>f3 :Ack! <c-r>=expand("<cword>")<CR>
    nnoremap <leader>f4 :Ack! <c-r>=expand("<cword>") . ' /usr/include/'<CR>
    " ====  ack.vim quick help ===============
    " *?:*  a quick summary of these keys, repeat to close
    " *o:*  to open (same as Enter)
    " *O:*  to open and close the quickfix window
    " *go:*  to preview file, open but maintain focus on ack.vim results
    " *t:*  to open in new tab
    " *T:*  to open in new tab without moving to it
    " *h:*  to open in horizontal split
    " *H:*  to open in horizontal split, keeping focus on the results
    " *v:*  to open in vertical split
    " *gv:*  to open in vertical split, keeping focus on the results
    " *q:*  to close the quickfix window
    "==============================================================================================
Plug 'vim-scripts/taglist.vim'
    let Tlist_Auto_Open = 1
    let Tlist_WinWidth = 40
    let Tlist_Use_Right_Window = 1
    let Tlist_Enable_Fold_Column = 0
"    let Tlist_Ctags_Cmd='gtags'
    let Tlist_Show_One_File=0
    let Tlist_File_Fold_Auto_Close=1
    let Tlist_Exit_OnlyWindow=1
    let Tlist_Process_File_Always=1 "实时更新tags
    let Tlist_Inc_Winwidth=0
    nnoremap <silent> <F12> :TlistToggle<CR>
    "==============================================================================================
Plug 'Valloric/YouCompleteMe'
    let g:ycm_error_symbol = '❗️'
    let g:ycm_warning_symbol = '⚡️'
    let g:ycm_complete_in_strings = 1
    let g:ycm_show_diagnostics_ui = 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_min_num_of_chars_for_completion=2
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<Enter>']
	let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
	let g:ycm_add_preview_to_completeopt = 1
    set completeopt=menu,preview
    "==============================================================================================
Plug 'skywind3000/asyncrun.vim'
    let g:asyncrun_bell = 1
    let g:asyncrun_rootmarks = g:Coding_Roots
    nnoremap <silent><S-Y>	:call asyncrun#quickfix_toggle(6)<CR>
    "==============================================================================================
Plug 'MattesGroeger/vim-bookmarks'
    let g:bookmark_sign = '🍑'
    let g:bookmark_highlight_lines = 1
    let g:bookmark_save_per_working_dir = 1
    "==============================================================================================
Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_start_level = 2
    "==============================================================================================
Plug 'alpertuna/vim-header'
    let g:header_field_author = 'Brent'
    let g:header_field_author_email = 'sun@vmcode.com'
    let g:header_auto_add_header = 0
    let g:header_field_copyright =   'Copyright ©       : 2016-2019 vmCode. All rights reserved.'
    "==============================================================================================
Plug 'w0rp/ale', {'for': g:Coding_Files }
    let g:ale_linters = {
        \'asm':['gcc'],
        \'go':['golint'],
        \'python': ['pylint'],
        \'sh':['shellcheck'],
        \'c': ['cppcheck'], 
        \'cpp': ['cppcheck'],}  " flawfinder

    let g:ale_fixers = {
        \'*': ['remove_trailing_lines', 'trim_whitespace'],
        \'c':['clang-format'],
        \'cpp':['clang-format'],}

    let g:ale_linters_explicit = 1
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_open_list = 'on_save'
    let g:ale_set_quickfix = 1
    let g:ale_sign_error = '❗️'
    let g:ale_sign_warning = '⚡️'
    let g:ale_sign_column_always = 1
    let g:ale_echo_msg_info_str = 'I'
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'
    let g:ale_c_parse_makefile = 1
    let g:ale_c_parse_compile_commands = 1
    let g:ale_c_clang_options = '-Wall -O2 -std=gnu11'
    "==============================================================================================
Plug 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeIndicatorMapCustom = {
        \"Modified":"✹",
        \"Staged":"✚",
        \"uNTRACKED":"✭",
        \"Renamed":"➜",
        \"Unmerged":"═",
        \"Deleted":"✖",
        \"Dirty":"✗",
        \"Clean":"✔︎",
        \"Unknown":"?"}
    "==============================================================================================
Plug 'scrooloose/nerdtree'
    let NERDTreeWinSize = 40
    let NERDTreeAutoCenter = 1
    let NERDTreeShowHidden = 0
    let NERDTreeChDirMode = 2
    let NERDTreeShowLineNumbers = 1
    let g:NERDTreeDirArrowExpandable ='▸'
    let g:NERDTreeDirArrowCollapsible ='▾'
    let g:nerdtree_tabs_open_on_console_startup = 0
    let NERDTreeIgnore=['\.pyc','\~$','\.swp','\m4']
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    "==============================================================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    let s:airlineIterator = -1
    function! NextAirelineTheme()
        let s:mycolors = ["powerlineish", "distinguished", "qwq", "luna", "ravenpower", "term", "minimalist", "molokai", 
                    \"seagull", "ubaryd", "badcat", "hybridline", "monochrome", "hybrid", "sierra", "bubblegum", "onedark",
                    \"wombat", "cool", "papercolor", "solarized_flood", "zenburn", "laederon", "peaksea", "solarized"]
        let s:airlineIterator+=1
        if s:airlineIterator == len(s:mycolors)
            let s:airlineIterator=0
        endif
        let color = s:mycolors[s:airlineIterator]
        let g:airline_theme = color
        call airline#load_theme()
        redraw
        echo color
    endfunction
    let g:airline_theme = 'cool'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#tabline#buffer_nr_show = 1
    "==============================================================================================
Plug 'flazz/vim-colorschemes'
    if has('gui_running')
        set guioptions+=e
        set showtabline=2
    else
        set background=dark
        let s:iterator = -1
        function! NextColorScheme()
            let s:mycolors = ['gruvbox', 'pride', 'solarized8_dark_flat', 'crayon', 'turtles', 'happy_hacking', 'alduin', 'ubaryd', 
                        \'neodark', 'arcadia', 'briofita', 'evening', 'PaperColor', 'cake16', 'seoul256']
            let s:iterator+=1
            if s:iterator == len(s:mycolors)
                let s:iterator=0
            endif
            let color = s:mycolors[s:iterator]
            execute 'colorscheme '.color
            redraw
            echo color
        endfunction
    endif
    "==============================================================================================
Plug 'skywind3000/quickmenu.vim'
    let g:quickmenu_options = 'LH'
    let quickmenu_max_width = 50

    function! DiffFile()
        let text = input('Enter file name to diff: ')
        redraw | echo '' | redraw
        if text == ''
            return
        endif
        exec 'vsplit(vsp) '.fnameescape(text)
    endfunc
    function! ResetMenu()
        call quickmenu#reset()
        call quickmenu#append('# Coding', '')
        call quickmenu#append('H/Source', ':AT', ':AT vertical open source/header file')
        call quickmenu#append('open Under Cursor', ':IH', ':IH Open file under cursor')
        call quickmenu#append('ALEFix', ':ALEFix', 'Call Fixers include code-format (:ALEFix)')
        call quickmenu#append('Compare file', 'call DiffFile()', 'vsplit(vsp) filename to vertical diff with')
        call quickmenu#append('Include-Fix', ':pyf /usr/lib/llvm-8/share/clang/clang-include-fixer.py','clang-include-fixer')

        call quickmenu#append('# YCM', '')
        call quickmenu#append('GoToDefinition'  , ':YcmCompleter GoToDefinition'    , 'GoToDefinition')
        call quickmenu#append('GoToInclude'     , ':YcmCompleter GoToInclude'       , 'GoToInclude')
        call quickmenu#append('GoToDeclaration' , ':YcmCompleter GoToDeclaration'   , 'GoToDeclaration') 
        call quickmenu#append('GoTo'            , ':YcmCompleter GoTo'              , 'Goto') 
        call quickmenu#append('GoToImprecise'   , ':YcmCompleter GoToImprecise'     , 'GoToImprecise') 
        call quickmenu#append('GetType'         , ':YcmCompleter GetType'           , 'GetType') 
        call quickmenu#append('GetTypeImprecise', ':YcmCompleter GetTypeImprecise'  , 'GetTypeImprecise') 
        call quickmenu#append('GetParent'       , ':YcmCompleter GetParent'         , 'GetParent') 
        call quickmenu#append('GetDoc'          , ':YcmCompleter GetDoc'            , 'GetDoc') 
        call quickmenu#append('GetDocImprecise' , ':YcmCompleter GetDocImprecise'   , 'GetDocImprecise') 
        call quickmenu#append('FixIt'           , ':YcmCompleter FixIt'             , 'FixIt') 
        
        call quickmenu#append('# Bookmark', '')
        call quickmenu#append('Add/Remove', ':BookmarkToggle', 'Add/remove  bookmark at current line (mm)')
        call quickmenu#append('annotation', ':BookmarkAnnotate', 'Add/edit/remove  annotation at current line (mi)')
        call quickmenu#append('Next', ':BookmarkNext', 'Jump to next bookmark in buffer (mn)')
        call quickmenu#append('Prev', ':BookmarkPrev', 'Jump to previous bookmark in buffer (mp)')
        call quickmenu#append('All', ':BookmarkShowAll', 'Show all bookmarks (ma)')
        call quickmenu#append('Clear', ':BookmarkClear', 'Clear bookmarks in current buffer only (mc)')
        call quickmenu#append('Clear All', ':BookmarkClearAll', 'Clear bookmarks in all buffers (mx)')
        call quickmenu#append('Move Up', ':BookmarkMoveUp','Move up bookmark at current line (mkk)')
        call quickmenu#append('Move Down', ':BookmarkMoveDown', 'Move down bookmark at current line (mjj)')

        call quickmenu#append('# AsyncRun', '')
        call quickmenu#append('Run', ':AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"','Run')
        call quickmenu#append('Make', ':AsyncRun -cwd=../build/ make','make')
        call quickmenu#append('Compile This File', ':AsyncRun clang -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" ','Compile Current File')
        call quickmenu#append('Make & run', ':AsyncRun -cwd=../build/ -raw make run','make and run')
        call quickmenu#append('Make Test', ':AsyncRun -cwd=../build/ -raw make test','make Test')

        call quickmenu#append('# Utility', '')
        call quickmenu#append('NerdTree',':NERDTreeToggle','NERD Toggle')
        call quickmenu#append('QuickFix (S-Y)', 'call asyncrun#quickfix_toggle(8)', 'QuickFix Window(S-Y)')
        call quickmenu#append('Undo Tree', ':UndotreeToggle', 'Show UndoTree Window')
        call quickmenu#append('Next Theme', 'call NextColorScheme()', 'Next VIM Theme')
        call quickmenu#append('Next airline Theme', 'call NextAirelineTheme()', 'Next VIM Theme')
        call quickmenu#append('Show help', ':help', 'Show help')
        call quickmenu#append('Show KeyMap', ':verbose map', 'Show Key map')
        call quickmenu#append('Edit init.vim',':vsplit $MYVIMRC','edit init.vim')
    endfunction

    noremap <silent>M :call quickmenu#toggle(0)<CR>
    "==============================================================================================
call plug#end()
call ResetMenu()
call InitMapKeys()
call UpdateUIColors()




