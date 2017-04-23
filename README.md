# Shortly, THE URL SHORTNER!

This application will take a url that you supply and give you a shortened path in return

## Installation

Clone this repo

```ruby
bundle install
bundle exec rails s
```

## How?

The app stores a shortly link in memory, object will only exist for as long as the applcation is running.

You can either visit the server at `http://localhost:3000` and enter a new url and get a shortly. or you can curl the root directly

```bash
curl -X GET \
  http://localhost:4000/2741de \
  -H 'accept: application/json' \
  -H 'content-type: application/json' \
  -d '{ "url": "http://www.example.com/a/long-url/that-i-want" }'
```

```ruby
{
  url: 'http://www.example.com/a/long-url/that-i-want',
  short_url: '/ab1234'
}
```
