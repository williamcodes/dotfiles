require 'rubygems'
require '~/.irb/gem_loader'
require '~/.irb/pry_loader'

if defined? ::Pry
  IRB::TopLevel.new.pry
  exit
end
