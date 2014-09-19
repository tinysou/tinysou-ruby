#!/usr/bin/env ruby
require 'tinysou'

TOKEN = 'YOUR_TOKEN'
ENGINE = 'YOUR_ENGINE_NAME'

engine = {
  name: ENGINE,
  display_name: 'My Blog'
}

collection = {
  name: 'posts',
  field_types: {
    title: 'string',
    tags: 'string',
    author: 'enum',
    date: 'date',
    body: 'text'
  }
}

document = {
  title: 'My First Post',
  tags: ['news'],
  author: 'Author',
  date: Time.now,
  body: 'Tinysou start online today!'
}

client = Tinysou::Client.new TOKEN

tasks = {
  engines: -> { client.engines },
  create_engine: -> { client.create_engine engine },
  engine: -> { client.engine engine[:name] },
  update_engine: -> { client.update_engine engine[:name], engine },
  destroy_engine: -> { client.destroy_engine engine[:name] },
  collections: -> { client.collections engine[:name] },
  create_collection: -> { client.create_collection engine[:name], collection },
  collection: -> { client.collection engine[:name], collection[:name] },
  destroy_collection: -> { client.destroy_collection engine[:name], collection[:name] },
  documents: -> { client.documents engine[:name], collection[:name], page: 0, per_page: 20 },
  create_document: -> { client.create_document engine[:name], collection[:name], document },
  update_document: lambda do
    id = client.documents(engine[:name], collection[:name]).first[:id]
    client.update_document engine[:name], collection[:name], id, document
  end,
  destroy_document: lambda do
    id = client.documents(engine[:name], collection[:name]).first[:id]
    client.destroy_document engine[:name], collection[:name], id
  end,
  search: -> { client.search engine[:name], q: 'first', c: collection[:name] },
  autocomplete: -> { client.autocomplete engine[:name], q: 'fi', c: collection[:name] }
}

if ARGV[0]
  arg = ARGV[0].to_sym
  p tasks[arg].call if tasks.include? arg
else
  puts 'Available arguments:'
  tasks.each { |k, _| puts k.to_s }
end
