define :osx_add_bin_path, :name => nil, :path => nil do
  template "/etc/paths.d/#{params[:name]}" do
    mode "0644"
    cookbook "osx"
    source "path.d.erb"
    variables("binpath" => params[:path])
  end
end