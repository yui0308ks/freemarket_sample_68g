FactoryBot.define do

  factory :address do
    family_name              {"山田"}
    last_name                {"太郎"}
    family_name_kana         {"カナ"}
    last_name_kana           {"カナ"}
    zip_code                 {"0000000"}
    prefectures              {"東京都"}
    city                     {"立川市"}
    block                    {"111"}
  end

end