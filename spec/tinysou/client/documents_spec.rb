require 'spec_helper'

describe Tinysou::Client::Documents do

  let(:client) { Tinysou::Client.new 'token' }

  describe '.documents' do
    it 'lists documents' do
      request = stub_get('engines/blog/collections/posts/documents')
                  .to_return(json_response('documents.json'))
      client.documents 'blog', 'posts'
      assert_requested request
    end
  end

  describe '.create_document' do
    it 'creates an document' do
      request = stub_post('engines/blog/collections/posts/documents')
                  .to_return(json_response('document.json'))
      client.create_document 'blog', 'posts', title: 'My First Blog'
      assert_requested request
    end
  end

  describe '.document' do
    it 'read an document' do
      request = stub_get('engines/blog/collections/posts/documents/1')
                  .to_return(json_response('document.json'))
      client.document 'blog', 'posts', '1'
      assert_requested request
    end
  end

  describe '.update_document' do
    it 'updates an document' do
      request = stub_put('engines/blog/collections/posts/documents/1')
                  .to_return(json_response('document.json'))
      client.update_document 'blog', 'posts', '1', title: 'First Blog'
      assert_requested request
    end
  end

  describe '.destroy_document' do
    it 'destroys an document' do
      request = stub_delete('engines/blog/collections/posts/documents/1')
                  .to_return(status: 204)
      client.destroy_document 'blog', 'posts', '1'
      assert_requested request
    end
  end
end
