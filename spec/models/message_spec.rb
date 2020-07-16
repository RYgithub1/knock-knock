require "rails_helper"

RSpec.describe Message, type: :model do
  describe "#create" do

    # ----- case1：メッセージ保存可能 -----
    context "messageを保存できる場合" do
      it "contentがあれば保存できることのテスト" do
        expect(build(:message, image: nil)).to be_valid
      end

      it "imageがあれば保存できることのテスト" do
        expect(build(:message, content: nil)).to be_valid
      end

      it "contentとimageがあれば保存できることのテスト" do
        expect(build(:message)).to be_valid
      end
    end

    # ----- case2：メッセージ保存不可 -----
    context "messageを保存できない場合" do
      it "content と imageが両方空だと保存できないことのテスト" do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("can't be blank")
      end

      it "pair_idが無いと保存できないことのテスト" do
        message = build(:message, pair_id: nil)
        message.valid?
        expect(message.errors[:pair]).to include("must exist")
      end

      it "user_idが無いと保存できないことのテスト" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("must exist")
      end
    end

  end
end