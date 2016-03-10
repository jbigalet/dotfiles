#! /usr/bin/env ruby

# from https://gist.github.com/frimik/5125436
# fix submodule conf in .git/config according to .gitmodules

submods = Hash.new

%x{git config -f .gitmodules --get-regexp '^submodule\..*\.(path|url)$'}.lines.each do |l|
  submodule, key, value = l.match(/^submodule\.(.*)\.(path|url)\s+(.*)$/)[1..3]
  submods[submodule] = Hash.new unless submods[submodule].is_a?(Hash)
  submods[submodule][key] = value
end

submods.each_pair do |s,k|
  %x{git submodule add #{k['url']} #{k['path']}}
end

%x{git submodule sync}
