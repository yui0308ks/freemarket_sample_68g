FactoryBot.define do
  factory :item do
    name                  {"カバン"}
    description           {"高級"}
    category_id           {"4"}
    delivery_charge_id    {"送料込み（出品者負担）"}
    delivery_day_id       {"1~2日で配送"}
    prefecture_id         {"1"}
    price                 {"99999"}
    created_at            {"2020-02-27 11:58:56"}
    updated_at            {"2020-02-27 11:58:56"}
    condition             {"新品"}

  end
end 