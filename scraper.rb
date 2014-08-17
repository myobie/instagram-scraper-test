require 'bundler'
Bundler.setup

require 'dotenv'
Dotenv.load

require 'pry'

$: << "./lib/"
require 'instagram'

client = Instagram::Client.new

response = client.tag("welshterrier")

media = response.data.map do |media_info|
  case media_info["type"]
  when "image"
    Instagram::Photo.new(media_info)
  when "video"
    Instagram::Video.new(media_info)
  end
end

users = media.map(&:user)

names = users.map(&:name)

puts names.uniq.sort.inspect

__END__

=> {"attribution"=>nil,
 "tags"=>["puppy", "welshterrier"],
 "location"=>{"latitude"=>-33.8801242, "name"=>"Casa de Villiers", "longitude"=>18.8315702, "id"=>160187532},
 "comments"=>{"count"=>0, "data"=>[]},
 "filter"=>"Normal",
 "created_time"=>"1408301571",
 "link"=>"http://instagram.com/p/rz2UOixktD/",
 "likes"=>
  {"count"=>2,
   "data"=>
    [{"username"=>"jeninetheron",
      "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
      "id"=>"607241138",
      "full_name"=>"jeninetheron"},
     {"username"=>"ghazyqaffaf",
      "profile_picture"=>"http://photos-f.ak.instagram.com/hphotos-ak-xfp1/10540329_413348372137005_287088508_a.jpg",
      "id"=>"294921659",
      "full_name"=>"Ghazi"}]},
 "images"=>
  {"low_resolution"=>
    {"url"=>"http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10601742_764588130274304_1623396274_a.jpg",
     "width"=>306,
     "height"=>306},
   "thumbnail"=>
    {"url"=>"http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10601742_764588130274304_1623396274_s.jpg",
     "width"=>150,
     "height"=>150},
   "standard_resolution"=>
    {"url"=>"http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10601742_764588130274304_1623396274_n.jpg",
     "width"=>640,
     "height"=>640}},
 "users_in_photo"=>[],
 "caption"=>
  {"created_time"=>"1408301571",
   "text"=>"Hier kom moeilikheid #puppy #welshterrier",
   "from"=>
    {"username"=>"cornelius910",
     "profile_picture"=>"http://images.ak.instagram.com/profiles/profile_7454497_75sq_1399715660.jpg",
     "id"=>"7454497",
     "full_name"=>"cornelius910"},
   "id"=>"789213244807334421"},
 "type"=>"image",
 "id"=>"789213244236909379_7454497",
 "user"=>
  {"username"=>"cornelius910",
   "website"=>"",
   "profile_picture"=>"http://images.ak.instagram.com/profiles/profile_7454497_75sq_1399715660.jpg",
   "full_name"=>"cornelius910",
   "bio"=>"",
   "id"=>"7454497"}}
