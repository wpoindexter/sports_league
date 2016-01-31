FactoryGirl.define do
  factory :player do
    first_name 'William'
    middle_name 'Ryan'
    last_name 'Poindexter'
    suffix 'Jr'
    birth_date Chronic.parse 'July, 18, 2006'
    weight 100
    grade 4
    email 'willryanp@gmail.com'
  end
end
