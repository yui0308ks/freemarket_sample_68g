require 'rails_helper'

describe User do
  describe '#create' do

    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, family_name, last_name, j_family_name, j_last_name, birthday_year, birthday_month, birthday_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5. family_nameが空では登録できないこと
    it "is invalid without an family_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    # 6. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    # 7. j_family_nameが空では登録できないこと
    it "is invalid without an j_family_name" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end


    # 8. j_last_nameが空では登録できないこと
    it "is invalid without an j_last_name" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    # 9. birthday_yearが空では登録できないこと
    it "is invalid without a birthday_year" do
      user = build(:user, birthday_year_id: "")
      user.valid?
      expect(user.errors[:birthday_year_id]).to include("は数値で入力してください")
    end

    # 9. birthday_monthが空では登録できないこと
    it "is invalid without an birthday_month" do
      user = build(:user, birthday_month_id: "")
      user.valid?
      expect(user.errors[:birthday_month_id]).to include("は数値で入力してください")
    end

    # 10. birthday_dayが空では登録できないこと
    it "is invalid without an birthday_day" do
      user = build(:user, birthday_day_id: "")
      user.valid?
      expect(user.errors[:birthday_day_id]).to include("は数値で入力してください")
    end

    # 11. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("は7文字以上で入力してください")
    end

    # 12. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 13. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters" do
      user = build(:user, password: "eeee0000", password_confirmation: "eeee0000")
      user.valid?
      expect(user).to be_valid
    end

  end
end