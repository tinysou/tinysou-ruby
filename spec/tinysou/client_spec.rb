require 'spec_helper'

describe Tinysou::Client do

  let(:client) { Tinysou::Client.new 'token' }

  it 'init' do
    c = Tinysou::Client.new 'token'
    expect(c.token).to eq('token')
  end

  describe '#get' do
    it 'make a GET request' do
      request = stub_get('/').to_return(json_response('version.json'))
      client.get ''
      assert_requested request
    end
  end

  describe '#post' do
    it 'make a POST request' do
      request = stub_post('/').to_return(json_response('version.json'))
      client.post ''
      assert_requested request
    end
  end

  describe '#put' do
    it 'make a PUT request' do
      request = stub_put('/').to_return(json_response('version.json'))
      client.put ''
      assert_requested request
    end
  end

  describe '#delete' do
    it 'make a DELETE request' do
      request = stub_delete('/').to_return(status: 204)
      client.delete ''
      assert_requested request
    end
  end
end
