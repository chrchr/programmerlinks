# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    association :link
    comment "This is where the user puts all their opinions about things. " +
      "Lorem ipsum etc etc."
    sequence(:username) {|n| "user_%d" % n}

    factory :invalid_comment do
      comment nil
    end
  end
end
