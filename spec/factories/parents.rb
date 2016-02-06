FactoryGirl.define do
  factory :father, class: Parent do
    first_name 'William'
    last_name 'Poindexter'
    suffix 'Sr'
    email 'wryanp@gmail.com'
    phone '6786419168'
  end

  factory :mother, class: Parent do
    first_name 'Ikwo'
    last_name 'Poindexter'
    email 'inpoindexter@gmail.com'
    phone '6362366059'
  end
end
