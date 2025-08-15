# Ittybit Ruby Library

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=https%3A%2F%2Fgithub.com%2Fittybit%2Fsdk-ruby)
[![rubygems shield](https://img.shields.io/gem/v/ittybit)](https://rubygems.org/gems/ittybit)

The Ittybit Ruby library provides convenient access to the Ittybit API from Ruby applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ittybit'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install ittybit
```

## Usage

### Basic Usage

```ruby
require 'ittybit'

# Initialize the client
client = Ittybit::Client.new(
  api_key: "YOUR_TOKEN",
  version: "YOUR_VERSION" # Optional
)

# Create a new media item
media = client.media.create(
  title: "My Video",
  metadata: { "credit": "gtv-videos-bucket" }
)

# Upload a file
file = client.files.create(
  url: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  filename: "bunny.mp4",
  folder: "examples/cartoons",
  metadata: { "credit": "gtv-videos-bucket" }
)

# Create a signed URL
signature = client.signatures.create(
  filename: "video.mp4",
  folder: "private/user_123",
  expiry: 1735689600,
  method: "GET"
)
```

### Async Usage

The SDK also provides async clients for non-blocking operations:

```ruby
require 'ittybit'
require 'async'

Async do
  client = Ittybit::AsyncClient.new(
    api_key: "YOUR_TOKEN",
    version: "YOUR_VERSION"
  )

  # Async operations
  media = client.media.create(
    title: "My Video",
    metadata: { "credit": "gtv-videos-bucket" }
  )
end
```

## Features

### Media Management

```ruby
# List all media
media_list = client.media.list(limit: 10)

# Get specific media
media = client.media.get(id: "media_id")

# Update media
updated_media = client.media.update(
  id: "media_id",
  title: "New Title",
  metadata: { "new_key": "new_value" }
)

# Delete media
client.media.delete(id: "media_id")
```

### File Management

```ruby
# List files
files = client.files.list(limit: 10)

# Get file details
file = client.files.get(id: "file_id")

# Upload file from URL
file = client.files.create(
  url: "https://example.com/video.mp4",
  filename: "video.mp4",
  folder: "videos",
  metadata: { "source": "example" }
)
```

### Task Management

```ruby
# Get task configuration
config = client.tasks.get_task_config

# Create a new task
task = client.tasks.create(
  kind: "ingest",
  url: "https://example.com/video.mp4",
  input: { "format": "mp4" }
)

# Get task status
task = client.tasks.get(id: "task_id")

# List tasks
tasks = client.tasks.list(
  limit: 10,
  status: "completed",
  kind: "ingest"
)
```

### Signed URLs

```ruby
# Generate a signed URL
signature = client.signatures.create(
  filename: "video.mp4",
  folder: "private/user_123",
  expiry: Time.now.to_i + 3600, # 1 hour from now
  method: "GET"
)
```

## Advanced Features

### Request Options

You can customize individual requests with additional options:

```ruby
# Custom timeout
client.media.create(
  title: "My Video",
  request_options: Ittybit::RequestOptions.new(
    timeout_in_seconds: 30
  )
)
```

The SDK only accepts the following headers:
- `Authorization`: Bearer token for authentication (required)
- `ACCEPT_VERSION`: API version specification (optional, defaults to latest)

### Error Handling

The SDK raises exceptions for API errors:

```ruby
begin
  client.media.get(id: "non_existent_id")
rescue Ittybit::Error => e
  puts "Error: #{e.message}"
  puts "Status code: #{e.status_code}"
  puts "Response body: #{e.body}"
end
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
