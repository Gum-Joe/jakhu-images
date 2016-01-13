# Create versions.sh in /metadata & metadata
# Create dir
Dir.mkdir('/metadata') unless File.directory?('/metadata')
commands = ["bundle", "coffee", "gcc", "gem", "g++", "less", "npm", "node", "node-gyp", "pip", "python", "ruby", "rvm", "sass", "virtualenv"]
script = <<-SHELL
#!/bin/bash
echo Using worker: $JAKHU_WORKER_NAME
# Source scripts
source ~/.nvm/nvm.sh
nvm use default
export PATH=/home/jakhu/.rvm/gems/ruby-head/bin:$PATH
source ~/.rvm/scripts/rvm
rvm use $RUBY_VERSION
SHELL
files = File.open("/metadata/version.sh", 'w+')
files.write(script)
commands.each do |x|
  if x != "g++" || x != "gcc"
    files.write("echo #{x} --version\n#{x} --version\necho\n")
  else
    files.write("echo #{x} --version\n#{x} --version\n")
  end
end
