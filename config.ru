require 'rack/contrib/try_static

use Rack::Deflater
use Rack::TryStatic
    root: 'tmp',
    urls: %w[/],
    ty:  %w[.html index.html /index.html]

FIVE_MINUTES=300

run lambda { |env|
  [ 
    404,
     {
      'Content-Type' =>'text/html'.
      'Cach-Control' => "public, max-age=#{FIVE_MINUTES}"
     },
    ['File not found']
  ]
}
