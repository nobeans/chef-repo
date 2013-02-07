#
# Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
# Cookbook Name:: java
# Recipe:: oracle_i386
#
# Copyright 2010-2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

java_home = node['java']["java_home"]

ruby_block  "set-env-java-home" do
  block do
    ENV["JAVA_HOME"] = java_home
  end
end

file "/etc/profile.d/jdk.sh" do
  content <<-EOS
    export JAVA_HOME=#{node['java']['java_home']}
  EOS
  mode 0755
end

java_ark "jdk" do
    url 'http://download.oracle.com/otn-pub/java/jdk/7u13-b20/jdk-7u13-linux-x64.tar.gz'
    checksum  '5045457407e120207ebd5c5b93ec6ee6ee61d76747ebf3ce467aad51c9c3cb5d'
    app_home '/usr/local/java/default'
    bin_cmds ["java", "javac", "jvisualvm", "jar", "keytool", "jstack", "jstat", "jps", "jmap", "jinfo", "jhat", "javap", "javadoc"]
    action :install
end
