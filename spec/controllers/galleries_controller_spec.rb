require 'rails_helper'

RSpec.describe GalleriesController, type: :controller do
  describe 'GET #index' do
    it 'assigns all galleries as @galleries' do
      gallery = FactoryGirl.create(:gallery)
      get :index
      expect(assigns(:galleries)).to eq([gallery])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested gallery as @gallery' do
      gallery = FactoryGirl.create(:gallery)
      get :show, {:id => gallery.to_param}
      expect(assigns(:gallery)).to eq(gallery)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Gallery' do
        expect {
          post :create, {:gallery => FactoryGirl.attributes_for(:gallery)}
        }.to change(Gallery, :count).by(1)
      end

      it 'assigns a newly created gallery as @gallery' do
        post :create, {:gallery => FactoryGirl.attributes_for(:gallery)}
        expect(assigns(:gallery)).to be_a(Gallery)
        expect(assigns(:gallery)).to be_persisted
      end

      it 'redirects to the created gallery' do
        post :create, {:gallery => FactoryGirl.attributes_for(:gallery)}
        expect(response).to redirect_to(Gallery.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested gallery' do
        gallery = FactoryGirl.create(:gallery)
        put :update, {:id => gallery.to_param, :gallery => FactoryGirl.attributes_for(:gallery)}
        gallery.reload
      end

      it 'assigns the requested gallery as @gallery' do
        gallery = FactoryGirl.create(:gallery)
        put :update, {:id => gallery.to_param, :gallery => FactoryGirl.attributes_for(:gallery)}
        expect(assigns(:gallery)).to eq(gallery)
      end

      it 'redirects to the gallery' do
        gallery = FactoryGirl.create(:gallery)
        put :update, {:id => gallery.to_param, :gallery => FactoryGirl.attributes_for(:gallery)}
        expect(response).to redirect_to(gallery)
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'destroys the requested gallery' do
      gallery = FactoryGirl.create(:gallery)
      expect {
        delete :destroy, {:id => gallery.to_param}
      }.to change(Gallery, :count).by(-1)
    end

    it 'redirects to the galleries list' do
      gallery = FactoryGirl.create(:gallery)
      aid = gallery.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(galleries_path)
    end
  end

end
