"$HOME/.vim/ftplugin/python.vim
" activer le filetype plugin avec la commande suivante dans le vimrc :
" if has("autocmd")
"   filetype plugin on
" endif
 
  
" Active l'auto-complètement pour python
set omnifunc=pythoncomplete#Complete

"Méthode de pli basée sur l'indentation
set foldmethod=indent

" Quelques recommandations PEP8
"
" nombre d'espace par tab
setlocal tabstop=4

" nombre de caractère utilisé pour l'indentation:
setlocal shiftwidth=4

" pour convertir les tab en espaces
" setlocal expandtab

" pour que backspace supprime 4 espaces:
setlocal softtabstop=4

" sur pression de la touche F3 highlight les caractères qui dépassent la 80ème colonne
map <silent> <F3> "<Esc>:match ErrorMsg '\%>80v.\+'<CR>"

" met en sur brillance les espaces et les tabs en trop
" pas réellement pour le python mais j'aime bien
"highlight RedundantSpaces ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

" Author: Nick Anderson <nick at anders0n.net>
" Website: http://www.cmdln.org
" Adapted from sonteks post on Vim as Python IDE
" http://blog.sontek.net/2008/05/11/python-with-a-modular-ide-vim/

python << EOF
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)sfrom ipdb import set_trace;set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

vim.command( 'map <f7> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine.lstrip()[:38] == 'from ipdb import set_trace;set_trace()':
            nLines.append( nLine)
            print nLine
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( 'normal %dG' % nCurrentLine)

vim.command( 'map <s-f7> :py RemoveBreakpoints()<cr>')
EOF
