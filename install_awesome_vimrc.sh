#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
set mouse=a
set belloff=all

"Copy lines below for kernel developing
"set tabstop=8
"set softtabstop=8
"set shiftwidth=8
"set noexpandtab
"set cindent

function SmoothScroll(up)
	if a:up
		let scrollaction="\<C-Y>"
	else
		let scrollaction="\<C-E>"
	endif
	exec "normal " . scrollaction
	redraw
	let counter=1
	while counter<&scroll
		let counter+=1
		sleep 10m
		redraw
		exec "normal " . scrollaction
	endwhile
endfunction

nnoremap <C-K> :call SmoothScroll(1)<Enter>
nnoremap <C-J> :call SmoothScroll(0)<Enter>
inoremap <C-K> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-J> <Esc>:call SmoothScroll(0)<Enter>i' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
