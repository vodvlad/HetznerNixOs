{ pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    # Установка плагинов
    configure = {
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          # Поиск и навигация
          fzf-vim
          nerdtree

          # UI и тема
          embark-vim
          vim-airline
          vim-indent-guides

          # Git
          vim-fugitive
          vim-gitgutter

          # Код и автодополнение
          nerdcommenter
          coc-nvim
          coc-pyright # Замена старого coc-python
          coc-json
          coc-tsserver
          coc-html
          coc-css
        ];
      };

      customRC = ''
        " --- Базовые настройки ---
        set encoding=utf-8
        set fileencoding=utf-8
        set number
        set relativenumber
        set nowrap
        set tabstop=4
        set shiftwidth=4
        set expandtab
        set autoindent
        set smartindent
        set smarttab
        set cursorline
        set showmatch
        set hlsearch
        set incsearch
        set ignorecase
        set smartcase
        set background=dark
        set shortmess+=c
        set clipboard=unnamedplus
        set mouse=a
        set termguicolors
        set list
        set listchars=tab:▸\ ,trail:·,extends:>,precedes:<

        syntax enable

        " --- Горячие клавиши ---
        nnoremap <C-p> :Files<CR>
        nnoremap <C-f> :Files<CR>
        nnoremap <C-b> :Buffers<CR>

        " --- Настройка темы ---
        colorscheme embark

        " --- Настройки плагинов ---
        let g:indent_guides_enable_on_vim_startup = 1

        " Настройка CoC: использование Tab для выбора автодополнения
        inoremap <silent><expr> <TAB>
              \ coc#pum#visible() ? coc#pum#next(1) :
              \ check_back_space() ? "\<Tab>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
      '';
    };
  };

  # Создаем файл настроек для CoC (вместо того, чтобы писать его в programs.neovim)
  environment.etc."xdg/nvim/coc-settings.json".text = builtins.toJSON {
    "suggest.noshowleft" = true;
    "python.analysis.typeCheckingMode" = "basic";
    "coc.preferences.formatOnSaveFiletypes" = [ "python" "javascript" "typescript" "json" ];
  };
}
