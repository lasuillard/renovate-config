_default:
    just --list

# Install common tools and deps
install:

# Update common tools and deps
update:
    nix flake update
    pre-commit autoupdate

alias up := update

# Validate Renovate configuration files
validate:
    renovate-config-validator --strict default.json
    find . -type f -name '*.json' -not -name 'default.json' -not -path '*/.*' -exec renovate-config-validator --strict --no-global {} +
