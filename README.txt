Notes to self:

Install git-delta with Homebrew, then add the following to ~/.gitconfig for split diff:

[user]
    name = bkamm
    email = brycekamm@gmail.com

[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    side-by-side = true
    line-numbers = true
    navigate = true
    dark = true
    syntax-theme = OneHalfDark
    file-decoration-style = "brightcyan ul"
    file-style = "brightcyan"
    hunk-header-decoration-style = "brightcyan box"
    hunk-header-file-style = "brightcyan"
    hunk-header-line-number-style = "brightcyan"
    inline-hint-style = "brightcyan"

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default

Add the following to LazyGit's config file in order to see split diff:
git:
  paging:
    colorArg: always
    pager: delta --side-by-side --line-numbers --paging=never

