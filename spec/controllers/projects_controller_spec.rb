require 'rails_helper'

RSpec.describe ProjectsController, :type => :controller do

  context 'when not logged in' do
    it 'returns unauthorized' do
      project = create(:project)
      delete :destroy, { id: project.id }
      expect(flash[:alert]).to match(/not authorized/i)
      expect(response).not_to be_success
    end
  end

  context 'when logged in as an admin' do
    before(:each) do
      login_admin
      @project = create(:project)
      @project_attribs = FactoryGirl.attributes_for(:project)
    end

    describe 'GET index' do
      it 'returns http success' do
        get :index
        expect(response).to be_success
      end
    end

    describe 'GET show' do
      it 'returns http success' do
        get :show, { id: @project.id }
        expect(response).to be_success
      end
    end

    describe 'GET new' do
      it 'returns http success' do
        get :new
        expect(response).to be_success
      end
    end

    describe 'POST create' do
      it 'returns http success' do
        count = Project.count
        post :create, project: @project_attribs
        expect(Project.count).to eq count + 1
      end
    end

    describe 'GET edit' do
      it 'returns http success' do
        get :edit, { id: @project.id }
        expect(response).to be_success
      end
    end

    describe 'PATCH update' do
      it 'updates a project' do
        @project_attribs[:title] = 'updated title'
        patch :update, id: @project.id, project: @project_attribs
        expect(@project.reload.title).to eq 'updated title'
        expect(flash[:notice]).to match(/success/)
      end
    end

    describe 'DELETE destroy' do
      it 'destroys a project' do
        count = Project.count
        delete :destroy, { id: @project.id }
        expect(Project.count).to eq count - 1
      end
    end
  end

end


