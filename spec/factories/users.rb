FactoryGirl.define do
  factory :user do
    #Add corresponding user attributes
    email { FFaker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
  end

end
