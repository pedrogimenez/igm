# IGM

You can use this library to implement Instagram login in your Ruby application.

We use this at [Chicisimo](https://github.com/chicisimo).

## Usage

```ruby
require "sinatra"
require "igm"

REDIRECT_URI = "https://something.com/login/instagram/token"

IGM.configure do |config|
  config.client_id     = "xxx"
  config.client_secret = "xxx"
end

get "/login/instagram" do
  redirect to(IGM.authorize_uri(redirect_uri: REDIRECT_URI, scope: %w{basic}))
end

get "/login/instagram/token" do
  code = params[:code]

  access_token = IGM.get_access_token(redirect_uri: REDIRECT_URI, code: code) # => "51116472.c3144az.2s1ce1c0074u4918aad3454263e4fe6c"

  user = IGM.get_user_info(access_token) # => {:username=>"pedrotgimenez", :bio=>"autodidact. I write software at @chicisimo.", :website=>"https://twitter.com/pedrotgimenez", :profile_picture=>"https://igcdn-photos-d-a.akamaihd.net/hphotos-ak-xap1/t51.2885-19/11191353_1624249301122731_1724880273_a.jpg", :full_name=>"Pedro Giménez", :counts=>{:media=>65, :followed_by=>1, :follows=>1}, :id=>"xxxx"}
end
```
