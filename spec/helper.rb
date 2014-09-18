def tinysou_url(path)
  "http://api.tinysou.com/v1#{path}"
end

def stub_get(path)
  stub_request(:get, tinysou_url(path))
end

def stub_post(path)
  stub_request(:post, tinysou_url(path))
end

def stub_put(path)
  stub_request(:put, tinysou_url(path))
end

def stub_delete(path)
  stub_request(:delete, tinysou_url(path))
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def json_response(file)
  {
    body: fixture(file),
    headers: {
      content_type: 'application/json'
    }
  }
end
