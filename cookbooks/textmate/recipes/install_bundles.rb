require 'json'

bundles_dir = ::File.join(ENV['HOME'], 'Library', 'Application Support', 'TextMate', 'Bundles')

directory bundles_dir do
  recursive true
end

JSON.parse(node[:textmate][:bundles]).each do |bundle_name, bundle_repo|
  # The git resource doesn't play nice on OSX
  execute "git" do
    command "git clone #{bundle_repo} \"#{::File.join(bundles_dir, bundle_name)}\""
    creates ::File.join(bundles_dir, bundle_name)
    action :run
  end
end