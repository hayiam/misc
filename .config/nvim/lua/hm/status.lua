local function o(s)
	vim.opt.statusline:append(s)
end

--set up statusline
vim.o.statusline=""
o("%#NormalMode#%{(mode()=='n')?'  NORMAL ':''}")
o("%#InsertMode#%{(mode()=='i')?'  INSERT ':''}")
o("%#RPlaceMode#%{(mode()=='r')?'  RPLACE ':''}")
o("%#VisualMode#%{(mode()=='v')?'  VISUAL ':''}")
o("%#StatusLine#")
o(" %t")
o("%r")
o("%m")
o("%=")
o("%#StatusLineNC#")
o(" %p%%")
o(" %l:%c") 
o("%#StatusLineNC#")
o("%{StatuslineTabWarning()}")
o("%{StatuslineTrailingSpaceWarning()}")
o("%#SeparatorLine#")
o(" ")
o("%#Encoding#")
o(" %y")
o(" %{&fileencoding?&fileencoding:&encoding}")
o("[%{&fileformat}]")
o(" ")
o("%#SeparatorLine#")
o(" ")
