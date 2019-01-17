require 'spec_helper'

describe 'threatstack::configure' do

  deploy_key = ENV['TS_DEPLOY_KEY'] ? ENV['TS_DEPLOY_KEY'] : "xKkRzesqg"
  feature_plan = ENV['TS_FEATURE_PLAN'] ? ENV['TS_FEATURE_PLAN'] : "monitor"
  ts_hostname = 'test-host'

  context 'on Debian 8' do
    let(:facts) { {'operatingsystem' => 'Debian', 'osfamily' => 'Debian', 'os' => { 'name' => 'Debian', 'release' => {'full' => '8.11', 'major' => '8', 'minor' => '11'}, 'distro' => {'codename' => 'jessie'}, 'family' => 'Debian'} } }
    let(:pre_condition) { "class { 'threatstack': deploy_key => '#{deploy_key}', ts_hostname => '#{ts_hostname}', rulesets => ['Default Ruleset', 'Service Ruleset'], agent_config_args => [{'log.level' => 'debug'}] }" }

    it { should contain_exec('threatstack-agent-setup').with(
      :command => "/usr/bin/tsagent setup --deploy-key='#{deploy_key}' --hostname='#{ts_hostname}' --ruleset='Default Ruleset' --ruleset='Service Ruleset'"
    )}
  end

  context 'on Debian 9' do
  end
  
  context 'on Ubuntu 18.04' do
  end

  context 'on Ubuntu 16.04' do
  end

  context 'on Ubuntu 14.04' do
  end

  context 'on Redhat' do
  end

  context 'on CentOS 7' do
  end

  context 'on Amazon Linux' do
  end

end
