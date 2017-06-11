require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: true, user: my_user) }

   describe "attributes" do
     it "has title, body, and user attributes" do
       expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: true, user: my_user)
     end
   end
end
