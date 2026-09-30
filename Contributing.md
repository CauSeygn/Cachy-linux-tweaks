# Setup

## Create Account and Link SSH
Create your account, then head over to `Settings → SSH / GPG Keys` and press `Add Key`, then:
- if you don't have an SSH key already generated, open powershell (Windows) or the terminal (Linux/MacOS) and do:
```sh
ssh-keygen -t ed25519 -a 100
```
- next copy it into the clipboard:
Linux (pick one):
```sh
# Wayland
wl-copy -t text/plain < ~/.ssh/id_ed25519.pub
# X11
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
```
Windows:
```sh
clip < ~/.ssh/id_ed25519.pub
```
MacOS:
```sh
pbcopy < ~/.ssh/id_ed25519.pub
```
Paste that back into the field on the website, then do:
```sh
ssh -T git@codeberg.org
```
and you'll see an output letting you know you're connected. To verify it, press verify and do what it tells you.

## Link Account to VSCode
Whatever you clone, simply clone via SSH, that's it.

## Creating Pull Requests
- Fork this repo via the site
- Clone via SSH onto your PC
- (VSCode method):
    - Open the folder containing the repo you just cloned
    - Source Control → ... (where you see `main`) → Branch → Create Branch... → name it however you like → Publish your branch → make your edits
    - Put them in `categories/3rd-party/#number. WHATEVERYOUDECIDETONAMEIT`
        - You can add an `author.txt` to the same folder/name the folder after your username; you reserve the right to request a purging of your own 3rd-party commits, if for whatever reason you wish to do so at any time, simply open an issue requesting this
    - Once done, Source Control → Commit and Push
    - Open your PR via codeberg.org
    - Once merged you can delete the branch on codeberg.org and locally, in VSCode by navigating to Source Control → click where you used to see `main` and switch back to it → Branch → Delete Branch...
- (Zed method):
    - Open the folder containing the repo you just cloned
    - Up above (where you see `main`, mouse over the leftmost that says `Branch & Stash`) → create your branch by naming it however you like then pressing enter → Publish your branch → make your edits
    - Put them in `categories/3rd-party/#number. WHATEVERYOUDECIDETONAMEIT`
        - You can add an `author.txt` to the same folder/name the folder after your username; you reserve the right to request a purging of your own 3rd-party commits, if for whatever reason you wish to do so at any time, simply open an issue requesting this
    - Once done, Git Panel (`Ctrl + Shift + G`) → Stage All → write your commit message in the field → Commit → Push
    - Open your PR via codeberg.org
    - Once merged you can delete the branch on codeberg.org and locally, in Zed by switching back to `main` branch, then mousing over the one you wish to delete and clicking the trash can icon

# Standards
- Don't duplicate info, for example if you want to make sure the user has set up wine, point to it in the md via a hyperlink `[whatever you want to put here as the name](../../post-install tweaks/8. windows support/instructions.md)` (note that spaces must actually be replaced with `%20`, this is just a visual example)
- Add info that is missing, you can also provide examples and explanations if you want (but don't go writing essays unless absolutely needed), structure them under the correct path where they're expected
- If you want to add images, go ahead, just make an `assets` folder that lives either where your tweak does (in the same folder under assets), or on the main repo view, where the `categories` folder lives;
- Don't feel like you need to pretend you're the same person as me in your writing style, nor like you can't express individuality, but strive for coherence, don't be archwiki—wide as an ocean, deep as a puddle