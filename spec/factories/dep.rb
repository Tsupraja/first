FactoryGirl.define do
  factory :department do
    #name "IT1212"
   description "INFORMATION TECHNOLOGY"
   sequence(:name)  { |n| "IT#{n}" } 
   #dept{ generate(:name) }sequence(:email) { |n| "person#{n}@example.com" }

  end
end
