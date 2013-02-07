define :gvm, :user => nil, :group => nil, :version => nil do
  product = params[:name]
  user = params[:user]
  group = params[:group] || user
  home_dir = "/home/#{params[:user]}"
  proxy_file = "/etc/profile.d/proxy.sh"
  version = params[:version]

  bash "gvm install #{product}" do
    user user
    group group
    cwd home_dir
    environment "HOME" => home_dir
    code <<-EOC
      # initialize gvm
      source "#{home_dir}/.gvm/bin/gvm-init.sh"

      # set proxy if necessary
      if [ -f #{proxy_file} ]; then
        source #{proxy_file}
      fi

      # install
      gvm install #{product} #{version || ''}

      # TODO dummy command because somehow gvm returns 1 even when succeeded...
      echo "done."
    EOC
    creates "#{home_dir}/.gvm/#{product}/#{version.empty? ? 'current' : version}"
  end
end
