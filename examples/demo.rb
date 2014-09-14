require 'tinysou'

TOKEN = 'YOUR_TOKEN'

engine = {
  name: 'YOUR-blog',
  display_name: 'Blog'
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

# Engine
client.engines

client.create_engine engine

client.engine engine[:name]

client.update_engine engine[:name], display_name: 'My Blog'

client.destroy_engine engine[:name]

# Collection
client.collections engine[:name]

client.create_collection engine[:name], collection

client.collection engine[:name], collection[:name]

client.destroy_collection engine[:name], collection[:name]

# Document
client.documents engine[:name], collection[:name], page: 0, per_page: 20

doc = client.create_document engine[:name], collection[:name], document

client.document engine[:name], collection[:name], doc['id']

client.update_document engine[:name], collection[:name], doc['id'],
                       title: 'First Post'

client.destroy_document engine[:name], collection[:name], doc['id']

# Search
client.search engine[:name], collection[:name], q: 'tinysou'

# Autocomplete
client.autocomplete engine[:name], collection[:name], q: 't'
