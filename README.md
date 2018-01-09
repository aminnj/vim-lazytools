
## Lazy tools that probably nobody will use except for me

### Usage

The function manifest (all in namespace of `lazytools`) is as follows:


#### CoutTokens()
Toggles between
```cpp
blah1 blah2 "blah3" 
```
and 
```cpp
std::cout <<  " blah1: " << blah1 <<  " blah2: " << blah2 <<  " 'blah3': " << "blah3" <<  std::endl;
```
so you just list variables you want to dump, hit a short key combo, and you're ready to continue
debugging that script that is haunting you still.

### Installation

The structure of the repo is pathogen-compliant, so
```bash
cd ~/.vim/bundle && git clone https://github.com/aminnj/vim-lazytools
```


and put something like this in your `.vimrc`
```vim
autocmd FileType c,cpp nnoremap <leader>cp :call lazytools#CoutTokens()<CR>
```
