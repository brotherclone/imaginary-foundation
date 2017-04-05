require 'rails_helper'

RSpec.describe PromoCardsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all promo_cards as @promo_cards' do
      promo_card = FactoryGirl.create(:promo_card)
      get :index
      expect(assigns(:promo_cards)).to eq([promo_card])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested promo_card as @promo_card' do
      promo_card = FactoryGirl.create(:promo_card)
      get :show, {:id => promo_card.to_param}
      expect(assigns(:promo_card)).to eq(promo_card)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new PromoCard' do
        expect {
          post :create, {:promo_card => FactoryGirl.attributes_for(:promo_card)}
        }.to change(PromoCard, :count).by(1)
      end

      it 'assigns a newly created promo_card as @promo_card' do
        post :create, {:promo_card => FactoryGirl.attributes_for(:promo_card)}
        expect(assigns(:promo_card)).to be_a(PromoCard)
        expect(assigns(:promo_card)).to be_persisted
      end

      it 'redirects to the created promo_card' do
        post :create, {:promo_card => FactoryGirl.attributes_for(:promo_card)}
        expect(response).to redirect_to(PromoCard.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested promo_card' do
        promo_card = FactoryGirl.create(:promo_card)
        put :update, {:id => promo_card.to_param, :promo_card => FactoryGirl.attributes_for(:promo_card)}
        promo_card.reload
      end

      it 'assigns the requested promo_card as @promo_card' do
        promo_card = FactoryGirl.create(:promo_card)
        put :update, {:id => promo_card.to_param, :promo_card => FactoryGirl.attributes_for(:promo_card)}
        expect(assigns(:promo_card)).to eq(promo_card)
      end

      it 'redirects to the promo_card' do
        promo_card = FactoryGirl.create(:promo_card)
        put :update, {:id => promo_card.to_param, :promo_card => FactoryGirl.attributes_for(:promo_card)}
        expect(response).to redirect_to(promo_card)
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'destroys the requested promo_card' do
      promo_card = FactoryGirl.create(:promo_card)
      expect {
        delete :destroy, {:id => promo_card.to_param}
      }.to change(PromoCard, :count).by(-1)
    end

    it 'redirects to the promo_cards list' do
      promo_card = FactoryGirl.create(:promo_card)
      aid = promo_card.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(promo_cards_path)
    end
  end

end
