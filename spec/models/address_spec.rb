require 'rails_helper'

describe Address do
  describe '#create' do

    # 1. user_id以外がなければ登録できない。
    it "is valid with a first_name, last_name, first_name_kana, last_name_kana, zip_code, prefectures, city, block, details" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. family_nameが空では登録できないこと
    it "is invalid without an family_name" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    # 3. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      address = build(:address, last_name: "")
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    # 4. j_family_nameが空では登録できないこと
    it "is invalid without an j_family_name" do
      address = build(:address, first_name_kana: "")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end


    # 5. j_last_nameが空では登録できないこと
    it "is invalid without an j_last_name" do
      address = build(:address, last_name_kana: "")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("を入力してください")
    end

    # 6. postal_codeが空では登録できないこと
    it "is invalid without an postal_code" do
      address = build(:address, zip_code: "")
      address.valid?
      expect(address.errors[:zip_code]).to include("を入力してください")
    end

    # 7. municipalityが空では登録できないこと
    it "is invalid without a municipality" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    # 8. numberが空では登録できないこと
    it "is invalid without an number" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without an number" do
      address = build(:address, block: "")
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end

  end
end