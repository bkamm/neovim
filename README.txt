Notes to self:

Install git-delta with Homebrew, then add the following to ~/.gitconfig for split diff:
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    side-by-side = true
    line-numbers = true
    navigate = true
    syntax-theme = Monokai Extended

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default


Add the following to LazyGit's config file in order to see split diff:
git:
  paging:
    colorArg: always
    pager: delta --side-by-side --line-numbers --paging=never

