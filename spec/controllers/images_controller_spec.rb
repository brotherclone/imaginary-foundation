require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Image' do
        expect {
          post :create, {:image => FactoryGirl.attributes_for(:image)}
        }.to change(Image, :count).by(1)
      end
      it 'assigns a newly created image as @image' do
        post :create, {:image => FactoryGirl.attributes_for(:image)}
        expect(assigns(:image)).to be_a(Image)
        expect(assigns(:image)).to be_persisted
      end
      it 'redirects to the created image' do
        post :create, {:image => FactoryGirl.attributes_for(:image)}
        expect(response).to redirect_to(Image.last)
      end
    end
  end
  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested image' do
        image = FactoryGirl.create(:image)
        put :update, {:id => image.to_param, :image => FactoryGirl.attributes_for(:image)}
        image.reload
      end
      it 'assigns the requested image as @image' do
        image = FactoryGirl.create(:image)
        put :update, {:id => image.to_param, :image => FactoryGirl.attributes_for(:image)}
        expect(assigns(:image)).to eq(image)
      end
      it 'redirects to the image' do
        image = FactoryGirl.create(:image)
        put :update, {:id => image.to_param, :image => FactoryGirl.attributes_for(:image)}
        expect(response).to redirect_to(image)
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'destroys the requested image' do
      image = FactoryGirl.create(:image)
      expect {
        delete :destroy, {:id => image.to_param}
      }.to change(Image, :count).by(-1)
    end
    it 'redirects to the images list' do
      image = FactoryGirl.create(:image)
      pid =image.to_param
      delete :destroy, {:id => pid}
      expect(response).to redirect_to(images_path)
    end
  end
end
