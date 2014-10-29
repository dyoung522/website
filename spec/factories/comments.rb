FactoryGirl.define do

  factory :comment do
    user
    post
    detail 'Test Comment Detail'
  end

end
