FactoryBot.define do
  factory :user do
    nickname             { "山田" }
    email                { "ooo@ii.ss" }
    first_name           { "山田" }
    last_name            { "山田" }
    first_name_kana      { "ヤマダ" }
    last_name_kana       { "ヤマダ" }
    birthday_year_id     { "1999" }
    birthday_month_id    { "3" }
    birthday_day_id      { "3" }
    password              {"eeee0000"}
    password_confirmation {"eeee0000"}
  end
end