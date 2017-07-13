" ==============================================================================
" UI Kit
" ==============================================================================

let UIKit = {
\  'hr': "-----------------------------------------------------------------------------",
\  'h1': "------------------------------------------------------------------------------\n\n
         \------------------------------------------------------------------------------\n",
\  'h2': "==============================================================================\n\n
         \==============================================================================\n",
\  'airplane':   "✈",
\  'arrow':      "▶", 
\  'arrow2':     "❱",
\  'arrow3':     "➔",
\  'arrow4':     "➜",
\  'arrow5':     "❱",
\  'arrow6':     "⇨",
\  'arrow7':     "›",
\  'asterisk':   "✱",
\  'box':        "☐",
\  'box2':       "∎",
\  'bullet':     "•",  
\  'bullet2':    "◯",  
\  'bullet3':    "☉",
\  'check':      "✔",  
\  'check2':     "✓",  
\  'corner':     "∟",
\  'flag':       "⚐",
\  'lambda':     "𝝺", 
\  'larrow3':    "‹",
\  'larrow':     "❰",
\  'larrow2':    "❮",
\  'heart':      "♡",
\  'menu':       "☰",
\  'plus':       "✚",
\  'star':       "✭",
\  'star2':      "☆",
\  'star3':      "★",
\  'x':          "✘",
\  'x2':         "❌",
\  'x3':         "✖",
\  'x4':         "✕",
\  'x5':         "×"
\}

" -----------------------------------------------------------------------------
inoremap hhr  " <c-r>=UIKit.hr<cr><esc>o<esc>xxi

" ------------------------------------------------------------------------------
" H1
" ------------------------------------------------------------------------------
inoremap hh1  <c-r>=UIKit.h1<cr><esc>kVkk:TComment<cr>ja 

" ==============================================================================
" H2 
" ==============================================================================
inoremap hh2  <c-r>=UIKit.h2<cr><esc>kVkk:TComment<cr>ja 

" HH3
" -----------------------------------------------------------------------------
inoremap hh3  " <c-r>=UIKit.hr<cr><esc>O

" Unicode symbols
iabbrev uiairplane      <c-r>=UIKit.airplane<cr>
iabbrev uiarrow         <c-r>=UIKit.arrow<cr>
iabbrev uiarrow2        <c-r>=UIKit.arrow2<cr>
iabbrev uiarrow3        <c-r>=UIKit.arrow3<cr>
iabbrev uiarrow4        <c-r>=UIKit.arrow4<cr>
iabbrev uiarrow5        <c-r>=UIKit.arrow5<cr>
iabbrev uiarrow6        <c-r>=UIKit.arrow6<cr>
iabbrev uiarrow7        <c-r>=UIKit.arrow7<cr>
iabbrev uiasterisk      <c-r>=UIKit.asterisk<cr>
iabbrev uibox           <c-r>=UIKit.box<cr>
iabbrev uibox2          <c-r>=UIKit.box2<cr>
iabbrev uibullet        <c-r>=UIKit.bullet<cr>
iabbrev uibullet2       <c-r>=UIKit.bullet2<cr>
iabbrev uibullet3       <c-r>=UIKit.bullet3<cr>
iabbrev uicheck         <c-r>=UIKit.check<cr>
iabbrev uicheck2        <c-r>=UIKit.check2<cr>
iabbrev uicorner        <c-r>=UIKit.corner<cr>
iabbrev uiflag          <c-r>=UIKit.flag<cr>
iabbrev uilambda        <c-r>=UIKit.lambda<cr>
iabbrev uilarrow3       <c-r>=UIKit.larrow3<cr>
iabbrev uilarrow        <c-r>=UIKit.larrow<cr>
iabbrev uilarrow2       <c-r>=UIKit.larrow2<cr>
iabbrev uiheart         <c-r>=UIKit.heart<cr>
iabbrev uimenu          <c-r>=UIKit.menu<cr>
iabbrev uiplus          <c-r>=UIKit.plus<cr>
iabbrev uistar          <c-r>=UIKit.star<cr>
iabbrev uistar2         <c-r>=UIKit.star2<cr>
iabbrev uistar3         <c-r>=UIKit.star3<cr>
iabbrev uix             <c-r>=UIKit.x <cr>
iabbrev uix2            <c-r>=UIKit.x2<cr>
iabbrev uix3            <c-r>=UIKit.x3<cr>
iabbrev uix4            <c-r>=UIKit.x4<cr>
iabbrev uix5            <c-r>=UIKit.x5<cr>

" ZSH Env
iabbrev zenv #!/usr/bin/env zsh

" Log
iabbrev llg echo "> "<esc>hi
