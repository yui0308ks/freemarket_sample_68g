FactoryBot.define do
  factory :item do
    name                  {"カバン"}
    description           {"高級"}
    category_id           {"4"}
    delivery_charge_id    {"include"}
    delivery_day_id       {"one_day"}
    prefecture_id         {"1"}
    price                 {"99999"}
    created_at            {"2020-02-27 11:58:56"}
    updated_at            {"2020-02-27 11:58:56"}
    condition             {"old"}

  end
end