# Git Worktree Creator ( tree planter ?)

## NOTES

The only reason I don't work in git worktrees is, for each "branch" I create, all the dependencies ( node_modules ) have to be fresh installed.. 
Which isn't ideal when wanting to switch branches fast. Maybe for longer running branches but not for all the smaller short-lived feature branches. 

### What this script should do: 

1. run a script like `gcwt (git create work tree) ${BRANCH} ${INSTALL_SCRIPT}`
2. create a new git worktree from given branch
3. install dependencies. Don't know how to do this yet, maybe an install script or command passed in?
4. I guess then, I should use git-worktree.nvim to switch between them?   

## REFERENCES

[ThePrimeagen/git-worktree.nvim](https:/t/github.com/ThePrimeagen/git-worktree.nvim)
[worktree docs](https://git-scm.com/docs/git-worktree)

## FEATURES 

- must create a work tree from the current directory
- must copy over all current dependencies if they exist (node_modules, etc)
- must run install/build script ( `yarn install`, etc ) 
