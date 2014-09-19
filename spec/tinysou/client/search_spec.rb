require 'spec_helper'

describe Tinysou::Client::Search do

  let(:client) { Tinysou::Client.new 'token' }

  describe '.search' do
    it 'search' do
      request = stub_post('engines/blog/search')
      client.search('blog', q: 'tinysou', c: 'page')
      assert_requested request
    end
  end

  describe '.autocomplete' do
    it 'autocomplete' do
      request = stub_post('engines/blog/autocomplete')
      client.autocomplete('blog', q: 'ti', c: 'page')
      assert_requested request
    end
  end
end
