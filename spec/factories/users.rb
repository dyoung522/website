FactoryGirl.define do
  factory :user do
    name 'Test A. User'
    email { "#{email_name(name.split)}@example.com" }
    password 'MySecretPassword'
  end
end

def email_name(array)
  [array.first[0], array.last].join.downcase
end
