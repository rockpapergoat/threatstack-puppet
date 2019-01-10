require 'spec_helper'

describe 'threatstack' do

  deploy_key = ENV['TS_DEPLOY_KEY'] ? ENV['TS_DEPLOY_KEY'] : "xKkRzesqg"
  feature_plan = ENV['TS_FEATURE_PLAN'] ? ENV['TS_FEATURE_PLAN'] : "monitor"

  context 'on Debian' do
    let(:facts) { {'osfamily' => 'Debian', 'os' => { 'name' => 'Debian', 'distro' => {'codename' => 'jessie'}, 'family' => 'Debian'} } }
    let(:params) { { :deploy_key => "#{deploy_key}", :feature_plan => "#{feature_plan}" } }

    it 'should compile' do should create_class('threatstack') end
    it { should contain_class('threatstack::package') }
    it { should contain_class('threatstack::configure') }

  end

  context 'on RedHat' do
    let(:facts) {  { 'operatingsystemmajrelease' => '7', 'os' => { 'release' => { 'major' => '7'}, 'family' => 'RedHat'} } }
    let(:params) { { :deploy_key => "#{deploy_key}", :feature_plan => "#{feature_plan}" } }

    it 'should compile' do should create_class('threatstack') end
    it { should contain_class('threatstack::package') }
    it { should contain_class('threatstack::configure') }

  end

  context 'on CentOS' do
    let(:facts) { {'operatingsystemmajrelease' => '7', 'os' => { 'release' => { 'major' => '7'}, 'name' => 'CentOS', 'family' => 'RedHat'} } }
    let(:params) { { :deploy_key => "#{deploy_key}", :feature_plan => "#{feature_plan}" } }

    it 'should compile' do should create_class('threatstack') end
    it { should contain_class('threatstack::package') }
    it { should contain_class('threatstack::configure') }

  end

  context 'on Amazon' do
    let(:facts) {  {'os' => { 'name' => 'Amazon', 'family' => 'RedHat'} } }
    let(:params) { { :deploy_key => "#{deploy_key}", :feature_plan => "#{feature_plan}" } }

    it 'should compile' do should create_class('threatstack') end
    it { should contain_class('threatstack::package') }
    it { should contain_class('threatstack::configure') }

  end



end
