require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe 'GET #index' do
    it 'assigns all images as @images' do
      image = FactoryGirl.create(:image)
      get :index
      expect(assigns(:images)).to eq([image])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested image as @image' do
      image = FactoryGirl.create(:image)
      get :show, {:id => image.to_param}
      expect(assigns(:image)).to eq(image)
    end
  end

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
end
