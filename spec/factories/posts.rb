FactoryGirl.define do

  factory :post do
    association :user, name: 'Post User'
    project
    title 'Test Post'
    detail 'Test Post Detail'
  end

end
