#!/bin/bash

# Define the alias you want to add
alias_to_add='alias tf="terraform"'

# Check if the .bash_profile file exists
bash_profile_file="$HOME/.bash_profile"
if [ -e "$bash_profile_file" ]; then
    # Check if the alias is already in .bash_profile
    if grep -qF "$alias_to_add" "$bash_profile_file"; then
        echo "Alias 'tf' for 'terraform' is already in $bash_profile_file."
    else
        # Add the alias to .bash_profile
        echo "$alias_to_add" >> "$bash_profile_file"
        echo "Alias 'tf' for 'terraform' added to $bash_profile_file."
        # Source .bash_profile to apply changes to the current session
        source "$bash_profile_file"
    fi
else
    echo "Error: $bash_profile_file does not exist. Please create it or add the alias manually."
fi
