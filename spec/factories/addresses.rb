FactoryBot.define do

  factory :address do
    first_name              {"山田"}
    last_name                {"太郎"}
    first_name_kana         {"カナ"}
    last_name_kana           {"カナ"}
    zip_code                 {9999999}
    prefecture              {"東京都"}
    city                     {"立川市"}
    block                    {"111"}
  end

end