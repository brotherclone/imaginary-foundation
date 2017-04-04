require 'rails_helper'

RSpec.describe PullQuotesController, type: :controller do
  describe 'GET #index' do
    it 'assigns all pull_quotes as @pull_quotes' do
      pull_quote = FactoryGirl.create(:pull_quote)
      get :index
      expect(assigns(:pull_quotes)).to eq([pull_quote])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested pull_quote as @pull_quote' do
      pull_quote = FactoryGirl.create(:pull_quote)
      get :show, {:id => pull_quote.to_param}
      expect(assigns(:pull_quote)).to eq(pull_quote)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new PullQuote' do
        expect {
          post :create, {:pull_quote => FactoryGirl.attributes_for(:pull_quote)}
        }.to change(PullQuote, :count).by(1)
      end

      it 'assigns a newly created pull_quote as @pull_quote' do
        post :create, {:pull_quote => FactoryGirl.attributes_for(:pull_quote)}
        expect(assigns(:pull_quote)).to be_a(PullQuote)
        expect(assigns(:pull_quote)).to be_persisted
      end

      it 'redirects to the created pull_quote' do
        post :create, {:pull_quote => FactoryGirl.attributes_for(:pull_quote)}
        expect(response).to redirect_to(PullQuote.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested pull_quote' do
        pull_quote = FactoryGirl.create(:pull_quote)
        put :update, {:id => pull_quote.to_param, :pull_quote => FactoryGirl.attributes_for(:pull_quote)}
        pull_quote.reload
      end

      it 'assigns the requested pull_quote as @pull_quote' do
        pull_quote = FactoryGirl.create(:pull_quote)
        put :update, {:id => pull_quote.to_param, :pull_quote => FactoryGirl.attributes_for(:pull_quote)}
        expect(assigns(:pull_quote)).to eq(pull_quote)
      end

      it 'redirects to the pull_quote' do
        pull_quote = FactoryGirl.create(:pull_quote)
        put :update, {:id => pull_quote.to_param, :pull_quote => FactoryGirl.attributes_for(:pull_quote)}
        expect(response).to redirect_to(pull_quote)
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'destroys the requested pull_quote' do
      pull_quote = FactoryGirl.create(:pull_quote)
      expect {
        delete :destroy, {:id => pull_quote.to_param}
      }.to change(PullQuote, :count).by(-1)
    end

    it 'redirects to the pull_quotes list' do
      pull_quote = FactoryGirl.create(:pull_quote)
      aid = pull_quote.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(pull_quotes_path)
    end
  end

end
