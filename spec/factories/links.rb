FactoryGirl.define do
  factory :link do
    name "The name for a link"
    sequence(:url) {|n|  "http://example.com/%d.html" % n}
    sequence(:username) {|n| "user_%d" % n}

    factory :invalid_link do
      name nil
    end
  end
end
