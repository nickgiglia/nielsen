require 'spec_helper'

describe "ForwardIts" do
  
  it "should forward to the requested page after signin" do
    user = Factory(:user)
    visit edit_user_path(user)
    # The test automatically follows the re-direct to the sign-in page
    fill_in :email,          :with => user.email
    fill_in :password,       :with => user.password
    click_button
    # The test will follow the re-direct one more time, going to users/edit
    response.should render_template('users/edit')
  end
end
