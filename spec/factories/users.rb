FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    zenkaku_familyname{'山田'}
    zenkaku_name{'太郎'}
    katakana_family_kana{'ヤマダ'}
    katakana_name_kana{'太郎'}
    birthday{'1995-12-1'}
  end
end