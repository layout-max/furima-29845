FactoryBot.define do
  factory :item do
    name {'画像'}
    info {'ご自由にお使いください。'}
    category_id {5} 
    condition_id {2}
    send_cost_id {2}
    area_id {2}
    delivery_id {2}
    price {'500'}
    association :user

     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
  end
end
