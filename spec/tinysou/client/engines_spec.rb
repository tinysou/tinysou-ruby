require 'spec_helper'

describe Tinysou::Client::Engines do

  let(:client) { Tinysou::Client.new 'token' }

  describe '.engines' do
    it 'lists engines' do
      request = stub_get('engines').to_return(json_response('engines.json'))
      client.engines
      assert_requested request
    end
  end

  describe '.create_engine' do
    it 'creates an engine' do
      request = stub_post('engines').to_return(json_response('engine.json'))
      client.create_engine name: 'blog', display_name: 'Blog'
      assert_requested request
    end
  end

  describe '.engine' do
    it 'read an engine' do
      request = stub_get('engines/blog').to_return(json_response('engine.json'))
      client.engine 'blog'
      assert_requested request
    end
  end

  describe '.update_engine' do
    it 'updates an engine' do
      request = stub_put('engines/blog').to_return(json_response('engine.json'))
      client.update_engine 'blog', display_name: 'MyBlog'
      assert_requested request
    end
  end

  describe '.destroy_engine' do
    it 'destroys an engine' do
      request = stub_delete('engines/blog').to_return(status: 204)
      client.destroy_engine('blog')
      assert_requested request
    end
  end
end
