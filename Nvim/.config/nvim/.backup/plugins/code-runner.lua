local ok, coderunner = pcall(require, "code_runner")
if not ok then
  return
end
coderunner.setup({
  filetype = {
    -- java = {
    --   "cd $dir &&",
    --   "javac $fileName &&",
    --   "java $fileNameWithoutExt"
    -- },
    -- python = "python3 -u",
    -- typescript = "deno run",
    -- rust = {
    --   "cd $dir &&",
    --   "rustc $fileName &&",
    --   "$dir$fileNameWithoutExt"
    -- },
  },
})
