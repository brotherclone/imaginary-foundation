require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all projects as @projects' do
      project = FactoryGirl.create(:project)
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end
  describe 'GET #show' do
    it 'assigns the requested project as @project' do
      project = FactoryGirl.create(:project)
      get :show, {:id => project.to_param}
      expect(assigns(:project)).to eq(project)
    end
  end
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Project' do
        expect {
          post :create, {:project => FactoryGirl.attributes_for(:project)}
        }.to change(Project, :count).by(1)
      end
      it 'assigns a newly created project as @project' do
        post :create, {:project => FactoryGirl.attributes_for(:project)}
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end
      it 'redirects to the created project' do
        post :create, {:project => FactoryGirl.attributes_for(:project)}
        expect(response).to redirect_to(Project.last)
      end
    end
  end
  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested project' do
        project = FactoryGirl.create(:project)
        put :update, {:id => project.to_param, :project => FactoryGirl.attributes_for(:project)}
        project.reload
      end
      it 'assigns the requested project as @project' do
        project = FactoryGirl.create(:project)
        put :update, {:id => project.to_param, :project => FactoryGirl.attributes_for(:project)}
        expect(assigns(:project)).to eq(project)
      end
      it 'redirects to the project' do
        project = FactoryGirl.create(:project)
        put :update, {:id => project.to_param, :project => FactoryGirl.attributes_for(:project)}
        expect(response).to redirect_to(project)
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'destroys the requested project' do
      project = FactoryGirl.create(:project)
      expect {
        delete :destroy, {:id => project.to_param}
      }.to change(Project, :count).by(-1)
    end
    it 'redirects to the projects list' do
      project = FactoryGirl.create(:project)
      pid =project.to_param
      delete :destroy, {:id => pid}
      expect(response).to redirect_to(projects_path)
    end
  end
end
