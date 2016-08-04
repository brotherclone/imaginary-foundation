require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all topics as @topics' do
      topic = FactoryGirl.create(:topic)
      get :index
      expect(assigns(:topics)).to eq([topic])
    end
  end
  describe 'GET #show' do
    it 'assigns the requested topic as @topic' do
      topic = FactoryGirl.create(:topic)
      get :show, {:id => topic.to_param}
      expect(assigns(:topic)).to eq(topic)
    end
  end
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Topic' do
        expect {
          post :create, {:topic => FactoryGirl.attributes_for(:topic)}
        }.to change(Topic, :count).by(1)
      end
      it 'assigns a newly created topic as @topic' do
        post :create, {:topic => FactoryGirl.attributes_for(:topic)}
        expect(assigns(:topic)).to be_a(Topic)
        expect(assigns(:topic)).to be_persisted
      end
      it 'redirects to the created topic' do
        post :create, {:topic => FactoryGirl.attributes_for(:topic)}
        expect(response).to redirect_to(Topic.last)
      end
    end
  end
  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested topic' do
        topic = FactoryGirl.create(:topic)
        put :update, {:id => topic.to_param, :topic => FactoryGirl.attributes_for(:topic)}
        topic.reload
      end
      it 'assigns the requested topic as @topic' do
        topic = FactoryGirl.create(:topic)
        put :update, {:id => topic.to_param, :topic => FactoryGirl.attributes_for(:topic)}
        expect(assigns(:topic)).to eq(topic)
      end
      it 'redirects to the topic' do
        topic = FactoryGirl.create(:topic)
        put :update, {:id => topic.to_param, :topic => FactoryGirl.attributes_for(:topic)}
        expect(response).to redirect_to(topic)
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'destroys the requested topic' do
      topic = FactoryGirl.create(:topic)
      expect {
        delete :destroy, {:id => topic.to_param}
      }.to change(Topic, :count).by(-1)
    end
    it 'redirects to the topics list' do
      topic = FactoryGirl.create(:topic)
      pid =topic.to_param
      delete :destroy, {:id => pid}
      expect(response).to redirect_to(topics_path)
    end
  end
end
