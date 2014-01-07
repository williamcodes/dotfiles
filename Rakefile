require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  overwrite_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.markdown LICENSE].include? file
    target = File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
    if File.exist?(target) or File.symlink?(target)
      if File.identical? file, target
        puts "identical #{target}"
      elsif overwrite_all
        overwrite(file, target)
      else
        print "overwrite #{target}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          overwrite_all = true
          overwrite(file, target)
        when 'y'
          overwrite(file, target)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def overwrite(file, target)
  if File.symlink?(target)
    puts "relink #{target} -> #{File.join(Dir.pwd, file)} (was #{File.readlink(target)})"
    system %Q{ln -sf "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{rm -rf "#{target}"}
    link_file(file)
  end
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

