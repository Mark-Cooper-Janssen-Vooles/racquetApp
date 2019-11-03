require 'rails_helper'
 
#to run:
# rspec spec/projects/user_spec.rb

RSpec.describe 'Home Page Title', type: :feature do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('RacquetApp')
  end
end


def sign_up_successfully
  visit "/"
  click_link "Login"
  click_link "Sign up"

  fill_in "Email", with: "user@user.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"

  click_button "Sign up"
end

def user_details_successfully
  sign_up_successfully

  click_button "Create User detail"
  sleep(1)
  fill_in "Name", with: "Solid snake"
  fill_in "Description", with: "This is totes not Stanley. This is totes not Stanley. This is totes not Stanley."
  attach_file('Picture', 'app/assets/images/solid_snake.png')
  fill_in "Postcode", with: "3000"
  fill_in "Address line", with: "30 Spencer Street"
  fill_in "Suburb", with: "Melbourne"
  fill_in "State", with: "VIC"

  sleep(1)
  click_button "Create User detail"
  expect(page).to have_content("User detail was successfully created.")
end


RSpec.feature "Create User", type: :feature do
  scenario "creates a user unsuccessfully" do
    sign_up_successfully

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "cannot create user details without info" do
    sign_up_successfully

    click_button "Create User detail"
    sleep(1)
    expect(page).to have_content("Location state can't be blank")
    expect(page).to have_content("Location state is not included in the list")

    expect(page).to have_content("Location suburb can't be blank")
    expect(page).to have_content("Location suburb is not included in the list")
    expect(page).to have_content("Location address line can't be blank")

    expect(page).to have_content("Location postcode can't be blank")
    expect(page).to have_content("Location postcode is not included in the list")

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Name is too short (minimum is 2 characters)")

    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Description : Please add a longer description!")
  end

  scenario "create user details successfully" do
    user_details_successfully
  end

  scenario "edit user details unsuccessfully" do 
    user_details_successfully
    click_link "Edit Profile"
    
    fill_in "Description", with: "This is totes not Stanley. This is totes not Stanley. This is totes not Stanley.This is totes not Stanley. This is totes not Stanley. This is totes not Stanley.This is totes not Stanley. This is totes not Stanley. This is totes not Stanley."
    sleep(5)

    click_button "Update User detail"

    expect(page).to have_content("Description : Please shorten your description to under 100 characters.")
  end

  scenario "edit user details successfully" do 
    user_details_successfully
    click_link "Edit Profile"

    fill_in "Description", with: "The snake market place had lots of cartoon snakes"

    click_button "Update User detail"

    expect(page).to have_content("User detail was successfully updated.")
    expect(page).to have_content("The snake market place had lots of cartoon snakes")
  end

end