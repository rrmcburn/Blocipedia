require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do

  let(:my_user) { FactoryGirl.create(:user) }
  let(:my_wiki) { FactoryGirl.create(:wiki, user: my_user) }

  before(:each) do
      sign_in my_user
    end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wiki" do
      get :index
      expect(assigns(:wiki)).to eq([my_wiki])
    end
  end

  describe "GET new" do
  it "returns http success" do
    get :new
    expect(response).to have_http_status(:success)
    end

  it "renders the #new view" do
    get :new
    expect(response).to render_template :new
    end

  it "instantiates @wiki" do
    get :new
    expect(assigns(:wiki)).not_to be_nil
    end
  end

describe "POST create" do
  it "increases the number of Wiki by 1" do
    expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Wiki,:count).by(1)
    end

  it "assigns the new post to @wiki" do
    post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
    expect(assigns(:wiki)).to eq Wiki.last
    end

  it "redirects to the new wiki" do
    post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
    expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET show" do
     it "returns http success" do
       get :show, {id: my_wiki.id}
       expect(response).to have_http_status(:success)
     end

     it "renders the #show view" do
       get :show, {id: my_wiki.id}
       expect(response).to render_template :show
     end

     it "assigns my_post to @post" do
       get :show, {id: my_wiki.id}
       expect(assigns(:wiki)).to eq(my_wiki)
     end
   end

   describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_wiki.id}
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       get :edit, {id: my_wiki.id}
       expect(response).to render_template :edit
     end

     it "assigns post to be updated to @wiki" do
       get :edit, {id: my_wiki.id}

       post_instance = assigns(:wiki)

       expect(post_instance.id).to eq my_wiki.id
       expect(post_instance.title).to eq my_wiki.title
       expect(post_instance.body).to eq my_wiki.body
     end
   end

   describe "PUT update" do
     it "updates wiki with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, id: my_wiki.id, post: {title: new_title, body: new_body}

       updated_wiki = assigns(:wiki)
       expect(updated_wiki.id).to eq my_wiki.id
       expect(updated_wiki.title).to eq new_title
       expect(updated_wiki.body).to eq new_body
     end

     it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, id: my_wiki.id, post: {title: new_title, body: new_body}
       expect(response).to redirect_to my_wiki
     end
   end

   describe "DELETE destroy" do
      it "deletes the wiki" do
        delete :destroy, {id: my_wiki.id}
        count = Wiki.where({id: my_wiki.id}).size
        expect(count).to eq 0
      end

      it "redirects to wikis index" do
        delete :destroy, {id: my_wiki.id}
        expect(response).to redirect_to wikis_path
      end
    end

end
