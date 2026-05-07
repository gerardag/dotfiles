# Terraform
alias tf='terraform'

# Navegar projectes amb fzf
c() {
  local base="$CODE_PATH"
  [ -d "$CODE_PATH/Work" ] && base="$CODE_PATH/Work"
  local dir
  dir=$(ls "$base" | fzf --prompt="Projecte: " --height=40% --reverse) && cd "$base/$dir"
}
