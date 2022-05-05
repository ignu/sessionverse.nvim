# SessionVerse

A git aware session manager for neovim. 

# Commands (none of this is real yet, README driven development)

### `:SessionVerseOpen`

Opens the session for the current branch.

If no session exists, it'll open all dirty files on the branch.

If no dirty files exist, it'll open all files changes in the last commit.

### `:SessionVerseSave`

Save a session for the current branch

### `:SessionVerseGlobalSave (name)`

Saves a session that doesn't respect 

### `:SessionVerseJump`

Opens a list of known sessions and if there're no dirty files jumps you to the branch and session.

### Inspiration

[https://github.rom/rmagatti/auto-session](https://github.com/rmagatti/auto-session)
