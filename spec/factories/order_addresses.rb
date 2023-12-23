FactoryBot.define do
  factory :order_address do
    postcode      { '123-4567' }
    prefecture_id { '2' }
    city          { 'テスト' }
    block         { 'テスト' }
    building      { 'テスト' }
    phone_number  { '00000000000' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
