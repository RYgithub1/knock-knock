require "rails_helper"
# for create method of user.rb(User class)
# name , emsil and PW are mandatory. if not, can not register.
describe User do
  describe "#create" do

    it "name、email、PWとPW_confirmationが存在すれば登録できることのテスト" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがない場合は登録できないことのテスト" do
      user = build(:user, name: nil)
      # validation -> (errorなし)true , (error発生)false
      user.valid?
      # チェックした結果、インスタンスが持つエラー文が期待したものか
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "emailがない場合は登録できないことのテスト" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "PWがない場合は登録できないことのテスト" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "PWが存在してもPW_confirmationがない場合は登録できないことのテスト" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "nameが8文字以上であれば登録できることのテスト" do
      user = build(:user, name: "testTest")
      user.valid?
      expect(user.errors[:name]).to include()
    end

    it "nameが7文字以下であれば登録できないことのテスト" do
      user = build(:user, name: "testTes")
      user.valid?
      expect(user.errors[:name]).to include("is invalid")
    end

    it "重複したemailが存在する場合登録できないことのテスト" do
      # firstUser
      user = create(:user)
      # firstUser.email -> instance which has same email.
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "PWが8文字以上であれば登録できることのテスト" do
      user = build(:user, password: "12345678", password_confirmation: "12345678")
      user.valid?
      expect(user.errors[:password]).to include()
    end

    it "PWが7文字以下であれば登録できないことのテスト" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

  end
end