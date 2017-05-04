
FactoryGirl.define do
  factory :post, :class => Refinery::Posts::Post do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

