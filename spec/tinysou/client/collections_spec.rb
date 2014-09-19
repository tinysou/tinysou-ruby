require 'spec_helper'

describe Tinysou::Client::Collections do

  let(:client) { Tinysou::Client.new 'token' }

  describe '.collections' do
    it 'lists collections' do
      request = stub_get('engines/blog/collections')
                  .to_return(json_response('collections.json'))
      client.collections 'blog'
      assert_requested request
    end
  end

  describe '.create_collection' do
    it 'creates an collection' do
      request = stub_post('engines/blog/collections')
                  .to_return(json_response('collection.json'))
      client.create_collection 'blog', name: 'posts'
      assert_requested request
    end
  end

  describe '.collection' do
    it 'read an collection' do
      request = stub_get('engines/blog/collections/posts')
                  .to_return(json_response('collection.json'))
      client.collection 'blog', 'posts'
      assert_requested request
    end
  end

  describe '.destroy_collection' do
    it 'destroys an collection' do
      request = stub_delete('engines/blog/collections/posts')
                  .to_return(status: 204)
      client.destroy_collection 'blog', 'posts'
      assert_requested request
    end
  end
end
