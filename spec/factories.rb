FactoryGirl.define do
  factory :user do
    email "factorygirl@example.com"
    password "password"
  end

  factory :article do
    title "Title"
    link "http://example.com"
    text "Article body"
  end
  
  factory :article_user do
    title "Title made by user"
    link "http://example.com"
    text "Article body made by user"
    user
  end
end
