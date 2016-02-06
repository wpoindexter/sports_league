FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'
    before(:create) do |user|
      user.skip_confirmation!
    end
  end
end
