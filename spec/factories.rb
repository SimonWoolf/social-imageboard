FactoryGirl.define do
  factory :user do
    email "factorygirl@example.com"
    password "password"
  end

  factory :article do
    title "Title"
    link "http://example.com"
    text "Article body"
    user
  end
end
