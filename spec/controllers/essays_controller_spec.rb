require 'rails_helper'

RSpec.describe EssaysController, type: :controller do
  describe 'GET #index' do
    it 'assigns all essays as @essays' do
      essay = FactoryGirl.create(:essay)
      get :index
      expect(assigns(:essays)).to eq([essay])
    end
  end
  describe 'GET #show' do
    it 'assigns the requested essay as @essay' do
      essay = FactoryGirl.create(:essay)
      get :show, {:id => essay.to_param}
      expect(assigns(:essay)).to eq(essay)
    end
  end
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Essay' do
        expect {
          post :create, {:essay => FactoryGirl.attributes_for(:essay)}
        }.to change(Essay, :count).by(1)
      end
      it 'assigns a newly created essay as @essay' do
        post :create, {:essay => FactoryGirl.attributes_for(:essay)}
        expect(assigns(:essay)).to be_a(Essay)
        expect(assigns(:essay)).to be_persisted
      end
      it 'redirects to the created essay' do
        post :create, {:essay => FactoryGirl.attributes_for(:essay)}
        expect(response).to redirect_to(Essay.last)
      end
    end
  end
  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested essay' do
        essay = FactoryGirl.create(:essay)
        put :update, {:id => essay.to_param, :essay => FactoryGirl.attributes_for(:essay)}
        essay.reload
      end
      it 'assigns the requested essay as @essay' do
        essay = FactoryGirl.create(:essay)
        put :update, {:id => essay.to_param, :essay => FactoryGirl.attributes_for(:essay)}
        expect(assigns(:essay)).to eq(essay)
      end
      it 'redirects to the essay' do
        essay = FactoryGirl.create(:essay)
        put :update, {:id => essay.to_param, :essay => FactoryGirl.attributes_for(:essay)}
        expect(response).to redirect_to(essay)
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'destroys the requested essay' do
      essay = FactoryGirl.create(:essay)
      expect {
        delete :destroy, {:id => essay.to_param}
      }.to change(Essay, :count).by(-1)
    end
    it 'redirects to the essays list' do
      essay = FactoryGirl.create(:essay)
      pid =essay.to_param
      delete :destroy, {:id => pid}
      expect(response).to redirect_to(essays_path)
    end
  end
end
