Factory.define :subscriber do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
end

Factory.define :show do |f|
  f.hashtag "#foo"
  f.admin_name "foo"
  f.admin_password "bar"
  f.start_time Time.now
end
