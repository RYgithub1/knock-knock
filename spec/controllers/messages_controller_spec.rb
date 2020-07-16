require "rails_helper"

describe MessagesController do
  # letメソ：複数のexampleで同一のインスタンスを使用。
  let(:pair) { create(:pair) }
  let(:user) { create(:user) }

  # ===== messages#index ===========================
  describe "#index" do
    # ----- ログイン中 --------------------
    context "ログインしている場合" do
      before do
        login user
        # message <- pairネストparams
        get :index, params: { pair_id: pair.id }
      end
      it "@messageに期待した値が入っていることのテスト" do
        expect(assigns(:message)).to be_a_new(Message)
      end
      it "@pairに期待した値が入っていることのテスト" do
        expect(assigns(:pair)).to eq pair
      end
      it "index.html.haml に遷移することのテスト" do
        expect(response).to render_template :index
      end
    end

    # ----- 未ログイン --------------------
    context "ログインしていない場合" do
      before do
        get :index, params: { pair_id: pair.id }
      end
      it "ログイン画面にリダイレクトすることのテスト" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # ===== messages#create ===========================
  describe "#create" do
    let(:params) { { pair_id: pair.id, user_id: user.id, message: attributes_for(:message) } }
    # ----- ログイン中 --------------------
    context "ログインしている場合" do
      before do
        login user
      end
      context "保存に成功した場合" do
        subject {
          post :create,
          params: params
        }
        it "messageを保存することのテスト" do
          expect{ subject }.to change(Message, :count).by(1)
        end
        it "pair_messages_pathへリダイレクトすることのテスト" do
          subject
          expect(response).to redirect_to(pair_messages_path(pair))
        end
      end
      context "保存に失敗した場合" do
        let(:invalid_params) { { pair_id: pair.id, user_id: user.id, message: attributes_for(:message, content: nil, image: nil) } }
        subject {
          post :create,
          params: invalid_params
        }
        it "messageを保存しないことのテスト" do
          expect{ subject }.not_to change(Message, :count)
        end
        it "index.html.hamlに遷移することのテスト" do
          subject
          expect(response).to render_template :index
        end
      end
    end

    # ----- 未ログイン --------------------
    context "ログインしていない場合" do
      it "new_user_session_pathにリダイレクトすることのテスト" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end