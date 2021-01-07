
# git multi-user management strategy
#
# usage:
#
#   git whoami
#   git identity work
#   git identity personal

git config --global --unset user.name
git config --global --unset user.email
git config --global --unset user.signingkey

git config --global user.useConfigOnly true

git config --global "user.$ID.name" "$NAME"
git config --global "user.$ID.email" "$EMAIL"
git config --global "user.$ID.signingkey" "$SIGNING_KEY"

git config --global alias.identity '! git config user.name "$(git config user.$1.name)"; git config user.email "$(git config user.$1.email)"; git config user.signingkey "$(git config user.$1.signingkey)"; :'
git config --global alias.whoami "! git var -l | grep '^GIT_.*_IDENT'"

# intellij merge tool
# idea.sh merge <left> <right> <base> <out>

