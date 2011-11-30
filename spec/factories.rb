Factory.define :subscriber do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
end

Factory.define :show do |f|
  f.association :user
  f.start_time Time.now
end

Factory.define :event do |f|
  f.association :show
  f.association :user
  f.state "guest"
end

Factory.define :chat do |f|
  f.association :show
  f.association :user
  f.message "Hello"
end

Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.password "foobar"
  f.password_confirmation "foobar"
  f.first_name "Foo"
  f.last_name "Bar"
  f.full_name "Foo Bar"
end
