{ pkgs, ... }: {
  channel = "stable-25.05";
  packages = [
    pkgs.zsh
  ];
  env = { };
  idx = {
    extensions = [
      "google.gemini-cli-vscode-ide-companion"
      "angular.ng-template"
      "bradlc.vscode-tailwindcss"
    ];
    workspace = {
      onCreate = {
        ohmyzsh-setup = ''
          echo "Verificando Oh My Zsh..."

          export RUNZSH=no
          export CHSH=no

          OHMYZSH="$HOME/.oh-my-zsh"
          ZSHRC="$HOME/.zshrc"

          if [ ! -d "$OHMYZSH" ]; then
            echo "Oh My Zsh não encontrado. Instalando..."

            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

            echo "Configurando tema 'jonathan'..."
            sed -i 's/ZSH_THEME=".*"/ZSH_THEME="jonathan"/' "$ZSHRC"

            echo "Inserindo ZSH_DISABLE_COMPFIX=true..."
            sed -i '/^source \$ZSH\/oh-my-zsh.sh/i ZSH_DISABLE_COMPFIX=true' "$ZSHRC"
        
          fi
        '';
      };
      onStart = { };
    };
  };
}
