require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :phone_number => "MyString",
      :group => nil,
      :home_place => nil,
      :work_place => nil
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_phone_number[name=?]", "user[phone_number]"

      assert_select "input#user_group_id[name=?]", "user[group_id]"

      assert_select "input#user_home_place_id[name=?]", "user[home_place_id]"

      assert_select "input#user_work_place_id[name=?]", "user[work_place_id]"
    end
  end
end
