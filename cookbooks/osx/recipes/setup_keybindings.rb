#http://blog.macromates.com/2005/key-bindings-for-switchers/

directory ::File.join(ENV['HOME'], 'Library', 'KeyBindings') do
  recursive true
end

cookbook_file ::File.join(ENV['HOME'], 'Library', 'KeyBindings', 'DefaultKeyBinding.dict') do
  source 'DefaultKeyBinding.dict'
end