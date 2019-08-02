FROM ketouem/ag-alpine as ag

FROM alpine:3.8

#RUN echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/main > /etc/apk/repositories && \
  #echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories && \
  #echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
  #echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN apk add --update tzdata && \
  cp /usr/share/zoneinfo/US/Pacific-New /etc/localtime && \
  echo "US/Pacific-New" > /etc/timezone && \
  apk del tzdata

RUN apk add --update \
  sudo \
  bash \
  git \
  git-perl \
  git-email \
  pcre-dev xz-dev \
  tmux \
  neovim \
  curl \
  python py-pip python-dev \
  openssl ca-certificates \
  docker \
  nodejs \
  nodejs-npm \
  fish \
  gcc \
  make \
  util-linux \
  openssh \
  bc \
  mdocml-apropos \
  perl \
  less \
  perl-git \
  shadow \
  groff \
  diffutils \
  linux-headers \
  jq \
  wrk \
  musl-dev \
  fzf \
  htop

COPY --from=ag /the_silver_searcher/ag /usr/bin/ag

RUN pip install --upgrade pip
RUN pip install awscli neovim awslogs

RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip \
  && unzip terraform_0.12.2_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.2_linux_amd64.zip

#git extras
RUN curl -sSL http://git.io/git-extras-setup | bash /dev/stdin

#node stuff
#RUN npm update -g npm
RUN npm i -g nodemon fx cwl jay-repl

#docker compose
RUN curl -L --fail https://github.com/docker/compose/releases/download/1.24.0/run.sh -o /usr/local/bin/docker-compose \
      && chmod +x /usr/local/bin/docker-compose

#docker extras
RUN curl -sSL https://raw.githubusercontent.com/jgallen23/docker-extras/master/install.sh | sudo bash

RUN delgroup ping && \
  groupmod -g 999 docker

RUN addgroup -g 1000 dev && \
  adduser -u 1000 -G dev -s /usr/bin/fish -h /home/dev -D dev && \
  passwd -d dev && \
  adduser dev docker && \
  echo "dev    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV HOME /home/dev
RUN mkdir -p $HOME
USER dev

RUN git clone https://github.com/firstandthird/aws-extras $HOME/aws-extras

#omf
RUN curl -L https://get.oh-my.fish > $HOME/install && \
  chmod +x $HOME/install && \
  $HOME/install --noninteractive && \
  rm $HOME/install

RUN cd $HOME/.local/share/omf/themes \ 
      && git clone https://github.com/oh-my-fish/theme-cbjohnson cbjohnson \
      && cd ../pkg \
      && git clone https://github.com/oh-my-fish/plugin-aws aws \
      && git clone https://github.com/tanmng/omf-aws-asp.git aws-asp

COPY vim $HOME/.vim
COPY vim/vimrc $HOME/.config/nvim/init.vim
COPY tmux.conf $HOME/.tmux.conf
COPY gitconfig $HOME/.gitconfig
COPY npmrc $HOME/.npmrc
COPY init $HOME/init
COPY bin $HOME/bin
COPY fish $HOME/.config/fish
RUN sudo chown -R dev:dev $HOME

#fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
RUN $HOME/.fzf/install --all

RUN mkdir -p $HOME/.vim/bundle && \
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/vundle

ENV VIM_UPDATE 20190204
RUN nvim -es -u $HOME/.vim/bundles.vim +PluginInstall +q

ENV PATH $PATH:$HOME/bin:$HOME/aws-extras

ENV TERM xterm-256color
ENV LANG en_US.UTF-8C.UTF-8
ENV LC_ALL en_US.utf-8

RUN chmod +x $HOME/init

WORKDIR $HOME

CMD ["/home/dev/init"]
