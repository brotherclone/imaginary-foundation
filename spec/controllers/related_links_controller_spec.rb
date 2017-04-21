require 'rails_helper'

RSpec.describe RelatedLinksController, type: :controller do
  describe 'GET #index' do
    it 'assigns all related_links as @related_links' do
      related_link = FactoryGirl.create(:related_link)
      get :index
      expect(assigns(:related_links)).to eq([related_link])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested related_link as @related_link' do
      related_link = FactoryGirl.create(:related_link)
      get :show, {:id => related_link.to_param}
      expect(assigns(:related_link)).to eq(related_link)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RelatedLink' do
        expect {
          post :create, {:related_link => FactoryGirl.attributes_for(:related_link)}
        }.to change(RelatedLink, :count).by(1)
      end

      it 'assigns a newly created related_link as @related_link' do
        post :create, {:related_link => FactoryGirl.attributes_for(:related_link)}
        expect(assigns(:related_link)).to be_a(RelatedLink)
        expect(assigns(:related_link)).to be_persisted
      end

      it 'redirects to the created related_link' do
        post :create, {:related_link => FactoryGirl.attributes_for(:related_link)}
        expect(response).to redirect_to(RelatedLink.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested related_link' do
        related_link = FactoryGirl.create(:related_link)
        put :update, {:id => related_link.to_param, :related_link => FactoryGirl.attributes_for(:related_link)}
        related_link.reload
      end

      it 'assigns the requested related_link as @related_link' do
        related_link = FactoryGirl.create(:related_link)
        put :update, {:id => related_link.to_param, :related_link => FactoryGirl.attributes_for(:related_link)}
        expect(assigns(:related_link)).to eq(related_link)
      end

      it 'redirects to the related_link' do
        related_link = FactoryGirl.create(:related_link)
        put :update, {:id => related_link.to_param, :related_link => FactoryGirl.attributes_for(:related_link)}
        expect(response).to redirect_to(related_link)
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'destroys the requested related_link' do
      related_link = FactoryGirl.create(:related_link)
      expect {
        delete :destroy, {:id => related_link.to_param}
      }.to change(RelatedLink, :count).by(-1)
    end

    it 'redirects to the related_links list' do
      related_link = FactoryGirl.create(:related_link)
      aid = related_link.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(related_links_path)
    end
  end

end
