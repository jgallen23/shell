FROM ketouem/ag-alpine as ag

FROM alpine:3.6

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN apk add --update tzdata && \
  cp /usr/share/zoneinfo/US/Pacific-New /etc/localtime && \
  echo "US/Pacific-New" > /etc/timezone && \
  apk del tzdata

RUN apk add --update \
  git \
  htop \
  pcre-dev xz-dev \
  tmux \
  neovim \
  curl \
  python py-pip \
  openssl ca-certificates \
  docker \
  nodejs \
  nodejs-npm \
  fish \
  bash \
  sudo \
  make \
  util-linux \
  openssh \
  bc \
  mdocml-apropos \
  perl \
  less \
  perl-git \
  shadow

COPY --from=ag /the_silver_searcher/ag /usr/bin/ag

RUN pip install awscli docker-compose

#git extras
RUN curl -sSL http://git.io/git-extras-setup | bash /dev/stdin

#node stuff
#RUN npm update -g npm
RUN npm i -g nodemon

RUN addgroup -g 1000 dev && \
  adduser -u 1000 -G dev -s /usr/bin/fish -h /home/dev -D dev && \
  passwd -d dev && \
  echo "dev    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV HOME /home/dev
RUN mkdir -p /work
RUN mkdir -p $HOME

COPY fish $HOME/.config/fish

#aws extras
RUN git clone https://github.com/firstandthird/aws-extras $HOME/aws-extras

#docker extras
RUN curl -sSL https://raw.githubusercontent.com/jgallen23/docker-extras/master/install.sh | sudo bash

#omf
RUN curl -L https://get.oh-my.fish > $HOME/install && \
  chmod +x $HOME/install && \
  $HOME/install --noninteractive && \
  rm $HOME/install

#fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf

#vim
RUN mkdir -p $HOME/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/vundle
COPY vim/bundles.vim $HOME/.vim/bundles.vim
RUN nvim -es -u $HOME/.vim/bundles.vim +PluginInstall +q

COPY vim $HOME/.vim
COPY vim/vimrc $HOME/.config/nvim/init.vim

COPY bin $HOME/bin
ENV PATH $PATH:$HOME/bin:$HOME/aws-extras

ENV TERM xterm-256color
ENV LANG en_US.UTF-8C.UTF-8
ENV LC_ALL en_US.utf-8

COPY tmux.conf $HOME/.tmux.conf
COPY gitconfig $HOME/.gitconfig
COPY init $HOME/init
RUN chmod +x $HOME/init

RUN chown -R dev:dev $HOME
USER dev
RUN $HOME/.fzf/install --all
WORKDIR $HOME

CMD ["/home/dev/init"]
