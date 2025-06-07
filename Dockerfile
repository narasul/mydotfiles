FROM debian:latest

run apt-get -y update

run apt-get install -y curl

run curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
run rm -rf /opt/nvim
run tar -C /opt -xzf nvim-linux-x86_64.tar.gz
ENV PATH="/opt/nvim-linux-x86_64/bin:${PATH}"

run apt-get install -y git
run apt-get install -y gcc
run apt-get install -y tmux

run git clone https://github.com/narasul/mykickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
run git clone https://github.com/narasul/mydotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/mydotfiles

run apt-get install -y ripgrep
run git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
run ~/.fzf/install --all

run mkdir -p $HOME/.oh-my-zsh/custom/themes/powerlevel10k
run git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

run git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

run mkdir -p $HOME/.local/scripts
run cp $HOME/.config/mydotfiles/tmux-sessionizer.sh $HOME/.local/scripts/
run cp $HOME/.config/mydotfiles/.zshrc $HOME/.zshrc
run cp $HOME/.config/mydotfiles/.tmux.conf ~/.tmux.conf

run apt-get install -y locales
run echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
run locale-gen
run DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

ENV LC_CTYPE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
