require 'rails_helper'

  describe Item do
    describe '#create' do

      it "is valid with a name, description, category_id, condition, delivery_charge_id, prefecture_id, delivery_day_id, price" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "is invalid without name" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("を入力してください", "は1文字以上で入力してください")
      end

     

      it "is invalid without description" do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("を入力してください")
      end

      it "is invalid without category_id" do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it "is invalid without condition" do
        item = build(:item, condition: nil)
        item.valid?
        expect(item.errors[:condition]).to include("を入力してください")
      end

      it "is invalid without delivery_charge_id" do
        item = build(:item, delivery_charge_id: nil)
        item.valid?
        expect(item.errors[:delivery_charge_id]).to include("を入力してください")
      end

      it "is invalid without prefecture_id" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end

      it "is invalid without delivery_day_id" do
        item = build(:item, delivery_day_id: nil)
        item.valid?
        expect(item.errors[:delivery_day_id]).to include("を入力してください")
      end

      it "is invalid without price" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください", "は数値で入力してください")
      end


  
      it "is valid with name that has less than 40 characters " do
        item = build(:item, name: "aaaaaa")
        item.valid?
        expect(item).to be_valid
      end

      it "is valid with description that has less than 1000 characters " do
        item = build(:item, description: "aaaaaa")
        item.valid?
        expect(item).to be_valid
      end
    end
  end