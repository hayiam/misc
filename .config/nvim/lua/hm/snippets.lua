-- function to set up snippets
local function s(ftype, snippet, cmdforconv, aftercmd)
    vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = ftype, 
      command = snippet .. "inoreabbrev " .. cmdforconv .. " <c-r>=g:snippet<cr><c-[>" .. aftercmd }
    )
end

--snippets
local html = [[
let snippet = "\<!DOCTYPE html>" . "\n"
let snippet .= "\<html>" . "\n"
let snippet .= "\n"
let snippet .= "\<head>" . "\n"
let snippet .= "\n"
let snippet .= "\<meta name='viewport' content='width=device-width, initial-scale=1.0' />" . "\n"
let snippet .= "\<title></title>" . "\n"
let snippet .= "\<style src=''></style>" . "\n"
let snippet .= "\n"
let snippet .= "\</head>" . "\n"
let snippet .= "\n"
let snippet .= "\<body>" . "\n"
let snippet .= "\n"
let snippet .= "\<script src=''>" . "\n"
let snippet .= "\</script>" . "\n"
let snippet .= "\n"
let snippet .= "\</body>" . "\n"
let snippet .= "\n"
let snippet .= "\</html>"
]]

local python = [[
let snippet = "main ():" . "\n"
let snippet .= "\n"
let snippet .= "\n"
let snippet .= "if __name__ == '__main__':" . "\n"
let snippet .= "\n"
let snippet .= "main()"
]]

local c = [[
let snippet = "#include <stdio.h>" . "\n"
let snippet .= "\n"
let snippet .= "\n"
let snippet .= "\n"
let snippet .= "int main(int argc, char *argv[]) {" . "\n"
let snippet .= "\n"
let snippet .= "return 0;" . "\n"
let snippet .= "}" . "\n"
]]

local cpp = [[
let snippet = "#include <iostream>" . "\n"
let snippet .= "\n"
let snippet .= "using namespace std;" . "\n"
let snippet .= "\n"
let snippet .= "\n"
let snippet .= "\n"
let snippet .= "int main() {" . "\n"
let snippet .= "\n"
let snippet .= "return 0;" . "\n"
let snippet .= "}" . "\n"
]]

s("html", html, "html!!", "gg6j3w")
s("python", python, "python!!", "0V2k<gg")
s("cpp", cpp, "cpp!!", "gg3j")
s("c", c, "c!!", "gg1j")
