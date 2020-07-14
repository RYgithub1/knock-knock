require "rails_helper"
# for create method of user.rb(User class)
# name is mandatory. if not, can not register.
describe User do
  describe "#create" do

    it "nameがない場合は登録できないことのテスト" do
      user = User.new(name: nil, email: "nameNilTest@gmail.com", password: "00000000", password_confirmation: "00000000")
      # validation -> (errorなし)true , (error発生)false
      user.valid?
      # チェックした結果、インスタンスが持つエラー文が期待したものか
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "emailがない場合は登録できないことのテスト" do
      user = User.new(name: "emailNilTest", email: nil, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

  end
end