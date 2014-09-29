# Tinysou

[![Build Status](https://travis-ci.org/tinysou/tinysou-ruby.svg?branch=master)](https://travis-ci.org/tinysou/tinysou-ruby)

Ruby library for the Tinysou API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinysou'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinysou

## Usage

```ruby
client = Tinysou::Client.new 'YOUR_TOKEN'
```

### Engine

List:

```ruby
client.engines
```

Create:

```ruby
client.create_engine name: 'blog', display_name: 'Blog'
```

Read:

```ruby
client.engine 'blog'
```

Update:

```ruby
client.update_engine 'blog', display_name: 'My Blog'
```

Delete:

```ruby
client.destroy_engine 'blog'
```

### Collection

List:

```ruby
client.collections 'blog'
```

Create:

```ruby
client.create_collection 'blog', name: 'posts', field_types: {
  title: 'string',
  tags: 'string',
  author: 'enum',
  date: 'date',
  body: 'text'
}
```

Read:

```ruby
client.collection 'blog', 'posts'
```

Destroy:

```ruby
client.destroy_collection 'blog', 'posts'
```

### Document

List:

```ruby
client.documents 'blog', 'posts', page: 0, per_page: 20
```

Create:

```ruby
client.create_document 'blog', 'posts', {
  title: 'My First Post',
  tags: ['news'],
  author: 'Author',
  date: '2014-08-16T00:00:00Z',
  body: 'Tinysou start online today!'
}
```

Read:

```ruby
client.document 'blog', 'posts', '293ddf9205df9b36ba5761d61ca59a29'
```

Update:

```ruby
client.update_document 'blog', 'posts', '293ddf9205df9b36ba5761d61ca59a29', {
  title: 'First Post'
}
```

Delete:

```ruby
client.destroy_document 'blog', 'posts', '293ddf9205df9b36ba5761d61ca59a29'
```

### Search

```ruby
client.search 'blog', {
    q: 'tinysou', c: 'posts',
    page: 0, per_parge: 10,
    filter: {
        range: {
            field: "date",
            from: "2014-07-01T00:00:00Z",
            to: "2014-08-01T00:00:00Z"
        }
    },
    sort: {
        field: "date",
        order: "asc",
        mode: "avg"
    }
}
```

### Autocomplete

```ruby
client.autocomplete 'blog', q: 't', c: 'posts'
```

## Examples

See [examples](https://github.com/tinysou/tinysou-ruby/tree/master/examples)

## Contributing

1. Fork it ( https://github.com/tinysou/tinysou-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
