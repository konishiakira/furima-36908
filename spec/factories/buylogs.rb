FactoryBot.define do
  factory :buylog do
    association :user
    association :item
  end
end
