require 'rails_helper'

RSpec.describe GoodwordsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all goodwords as @goodwords' do
      goodword = FactoryGirl.create(:goodword)
      get :index
      expect(assigns(:goodwords)).to eq([goodword])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested goodword as @goodword' do
      goodword = FactoryGirl.create(:goodword)
      get :show, {:id => goodword.to_param}
      expect(assigns(:goodword)).to eq(goodword)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Goodword' do
        expect {
          post :create, {:goodword => FactoryGirl.attributes_for(:goodword)}
        }.to change(Goodword, :count).by(1)
      end

      it 'assigns a newly created goodword as @goodword' do
        post :create, {:goodword => FactoryGirl.attributes_for(:goodword)}
        expect(assigns(:goodword)).to be_a(Goodword)
        expect(assigns(:goodword)).to be_persisted
      end

      it 'redirects to the created goodword' do
        post :create, {:goodword => FactoryGirl.attributes_for(:goodword)}
        expect(response).to redirect_to(Goodword.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested goodword' do
        goodword = FactoryGirl.create(:goodword)
        put :update, {:id => goodword.to_param, :goodword => FactoryGirl.attributes_for(:goodword)}
        goodword.reload
      end

      it 'assigns the requested goodword as @goodword' do
        goodword = FactoryGirl.create(:goodword)
        put :update, {:id => goodword.to_param, :goodword => FactoryGirl.attributes_for(:goodword)}
        expect(assigns(:goodword)).to eq(goodword)
      end

      it 'redirects to the goodword' do
        goodword = FactoryGirl.create(:goodword)
        put :update, {:id => goodword.to_param, :goodword => FactoryGirl.attributes_for(:goodword)}
        expect(response).to redirect_to(goodword)
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'destroys the requested goodword' do
      goodword = FactoryGirl.create(:goodword)
      expect {
        delete :destroy, {:id => goodword.to_param}
      }.to change(Goodword, :count).by(-1)
    end

    it 'redirects to the goodwords list' do
      goodword = FactoryGirl.create(:goodword)
      aid = goodword.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(goodwords_path)
    end
  end

end
