require 'rails_helper'

RSpec.describe GalleryImagesController, type: :controller do
  describe 'GET #index' do
    it 'assigns all gallery_images as @gallery_images' do
      gallery_image = FactoryGirl.create(:gallery_image)
      get :index
      expect(assigns(:gallery_images)).to eq([gallery_image])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested gallery_image as @gallery_image' do
      gallery_image = FactoryGirl.create(:gallery_image)
      get :show, {:id => gallery_image.to_param}
      expect(assigns(:gallery_image)).to eq(gallery_image)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new GalleryImage' do
        expect {
          post :create, {:gallery_image => FactoryGirl.attributes_for(:gallery_image)}
        }.to change(GalleryImage, :count).by(1)
      end

      it 'assigns a newly created gallery_image as @gallery_image' do
        post :create, {:gallery_image => FactoryGirl.attributes_for(:gallery_image)}
        expect(assigns(:gallery_image)).to be_a(GalleryImage)
        expect(assigns(:gallery_image)).to be_persisted
      end

      it 'redirects to the created gallery_image' do
        post :create, {:gallery_image => FactoryGirl.attributes_for(:gallery_image)}
        expect(response).to redirect_to(GalleryImage.last)
      end
    end
  end

end
