# NOTE: -------------------'s will be used to denote what is a codeblock,
# these do not exist within the file, this is for the reader.
# Tweak /etc/sudoers, by running (substitute nano for whichever editor you're
# comfortable using, default without variable is vi):

sudo EDITOR=nano visudo

# To entirely disable password prompts when running sudo
# (note that my username is banana308, substitute with yours naturally),
# locate the following:

# ---------------------------------------
## Read drop-in files from /etc/sudoers.d
@includedir /etc/sudoers.d
# ------------------------

# and just before that add (note the username):

Defaults:banana308 !authenticate

# Like so (note the username):

# ------------------------------
Defaults:banana308 !authenticate

## Read drop-in files from /etc/sudoers.d
@includedir /etc/sudoers.d
# ------------------------

# If you do not want this, but instead want to see the password
# you type within a sudo prompt, instead add this:

Defaults pwfeedback

# Like so:

#------------------
Defaults pwfeedback

## Read drop-in files from /etc/sudoers.d
@includedir /etc/sudoers.d
# ------------------------

# Then save and exit, depending on what you did, you'll see the immediate
# effect.

# To disable password prompts on the GUI side of things, open the terminal
# and type:

sudo cp 49-nopasswd_global.rules /etc/polkit-1/rules.d/49-nopasswd_global.rules

# The rule will disable GUI password prompts for users in the wheel group.
# Disabling both password prompt in sudo and password prompt in polkit
# effectively disables password prompts when performing admin actions entirely,
# system-wide.
# If you think this is unsafe, then I have bad news for you if you're
# the only one using your computer.

# Alternatively read the Arch wiki on sudo if you want to spend 5 years
# excluding commands one by one.