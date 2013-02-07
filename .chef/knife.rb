current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "nobeans"
client_key               "#{current_dir}/nobeans.pem"
validation_client_name   "nobeans-validator"
validation_key           "#{current_dir}/nobeans-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/nobeans"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

http_proxy  ENV["http_proxy"]
https_proxy ENV["https_proxy"]
