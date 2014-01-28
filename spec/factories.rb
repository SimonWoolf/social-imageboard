FactoryGirl.define do
  factory :post do
    title 'posttitle'
    link "http://example.com"
    body 'postbody'
    user nil
  end

  factory :user do
    email "factorygirl@example.com"
    password "password"
  end
end
