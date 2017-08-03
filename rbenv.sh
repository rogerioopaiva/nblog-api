#!/bin/bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv global 2.3.3

bash -c "[ -d \$HOME/.rbenv ]"
bash -c "[ -d \$HOME/.rbenv/plugins/ruby-build ]"
bash -c "env RBENV_ROOT\=\$HOME/.rbenv RBENV_VERSION\=2.3.3 CONFIGURE_OPTS\= RUBY_CONFIGURE_OPTS\= \$HOME/.rbenv/bin/rbenv local 2>/dev/null || true"
bash -c "mkdir \$HOME/.rbenv/.lock"
bash -c "env RBENV_ROOT\=\$HOME/.rbenv RBENV_VERSION\=2.3.3 CONFIGURE_OPTS\= RUBY_CONFIGURE_OPTS\= \$HOME/.rbenv/bin/rbenv versions --bare"
bash -c "env RBENV_ROOT\=\$HOME/.rbenv RBENV_VERSION\=2.3.3 CONFIGURE_OPTS\= RUBY_CONFIGURE_OPTS\= \$HOME/.rbenv/bin/rbenv rehash"
bash -c "env RBENV_ROOT\=\$HOME/.rbenv RBENV_VERSION\=2.3.3 CONFIGURE_OPTS\= RUBY_CONFIGURE_OPTS\= \$HOME/.rbenv/bin/rbenv exec gem list"
bash -c "env RBENV_ROOT\=\$HOME/.rbenv RBENV_VERSION\=2.3.3 CONFIGURE_OPTS\= RUBY_CONFIGURE_OPTS\= \$HOME/.rbenv/bin/rbenv rehash"
bash -c "rm -rf \$HOME/.rbenv/.lock"