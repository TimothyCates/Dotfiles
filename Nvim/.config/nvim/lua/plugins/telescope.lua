return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {"chip/telescope-software-licenses.nvim"},
  },
  init = function()
    local telescope = require("telescope")
    telescope.load_extension "fzf"
    telescope.load_extension "git_worktree"
    telescope.load_extension "software-licenses"
  end,
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true
      }
    }
  }
}
