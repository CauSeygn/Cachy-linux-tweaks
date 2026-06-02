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
MacOS
```sh
pbcopy < ~/.ssh/id_ed25519.pub
```
Paste that back into the field on the website, then do:
```sh
ssh -T git@git.gay
```
and you'll see an output letting you know you're connected. To verify it, press verify and do what it tells you.

## Link Account to VSCode
Whatever you clone, simply clone via SSH, that's it.

## Creating Pull Requests
- Fork this repo via the site
- Clone via SSH onto your PC
- (VSCode method):
    - Open the folder containing the repo you just cloned
    - Source Control → ... (where you see `main`) → Branch → Create Branch... → name it however you like → make your edits
    - Put them in `categories/3rd-party/#number. WHATEVERYOUDECIDETONAMEIT`
    - Once done, Source Control → Commit and Sync
    - Open your PR via git.gay
    - Once merged you can delete the branch on git.gay and locally, in VSCode by navigating to Source Control → click where you used to see `main` and switch back to it → Branch → Delete Branch...

# Standards
- Don't duplicate info, for example if you want to make sure the user has set up wine, point to it in the md via a hyperlink `[whatever you want to put here as the name](../../post-install tweaks/8. windows support/instructions.md)`
- Add info that is missing, you can also provide examples and explanations if you want (but don't go writing essays unless absolutely needed), structure them under the correct path where they're expected
- If you want to add images, go ahead, just make an `assets` folder that lives either where your tweak does (in the same folder under assets), or on the main repo view, where the `categories` folder lives;
- Don't feel like you need to pretend you're the same person as me in your writing style, nor like you can't express individuality, but strive for coherence, don't be archwiki—wide as an ocean, deep as a puddle