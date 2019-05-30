# Activates ssh-agent and adds ~/.ssh/id_rsa to ssh-agent keychain?
eval $(ssh-agent -s)
eval $(ssh-add ~/.ssh/id_rsa)

