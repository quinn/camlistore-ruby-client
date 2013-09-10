Example:
======================

```ruby
require 'camlistore'

camli = Camlistore.new
result = camli.enumerate_blobs(limit: 1)
result.blobs.first.blobRef # => "sha1-..."
```
