require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe GroupsController, type: :controller do


  it do
    params = {group: {name: 'raye7'}}
    should permit(:name).for(:create, params: params).on(:group)
  end

  describe "GET #index" do
    before { get :index }
    it { should respond_with(200) }
 
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  # This should return the minimal set of attributes required to create a valid
  # Group. As you add validations to Group, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: "raye7"}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # GroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
      get :index, params: {name: "honololo"}, session: valid_session
      expect(assigns(:groups)).to eq([group])
    end
  end

  describe "GET #show" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :show, params: {id: group.to_param}, session: valid_session
      expect(assigns(:group)).to eq(group)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new group as @group" do
  #     get :new, params: {}, session: valid_session
  #     expect(assigns(:group)).to be_a_new(Group)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested group as @group" do
  #     group = Group.create! valid_attributes
  #     get :edit, params: {id: group.to_param}, session: valid_session
  #     expect(assigns(:group)).to eq(group)
  #   end
  # end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, params: {group: valid_attributes}, session: valid_session
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, params: {group: valid_attributes}, session: valid_session
        expect(assigns(:group)).to be_a(Group)
        expect(assigns(:group)).to be_persisted
      end

      it "redirects to the created group" do
        post :create, params: {group: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Group.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        post :create, params: {group: invalid_attributes}, session: valid_session
        expect(assigns(:group)).to be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        post :create, params: {group: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested group" do
      group = Group.create! valid_attributes
      expect {
        delete :destroy, params: {id: group.to_param}, session: valid_session
      }.to change(Group, :count).by(-1)
    end

    it "redirects to the groups list" do
      group = Group.create! valid_attributes
      delete :destroy, params: {id: group.to_param}, session: valid_session
      expect(response).to redirect_to(groups_url)
    end
  end

end
