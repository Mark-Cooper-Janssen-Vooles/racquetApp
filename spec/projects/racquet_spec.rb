require 'rails_helper'

#acceptance testing

#to run:
# rspec spec/projects/racquet_spec.rb

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
  fill_in "Name", with: "Solid snake"
  fill_in "Description", with: "The snake market place had lots of cartoon snakes"
  attach_file('Picture', 'app/assets/images/solid_snake.png')
  fill_in "Postcode", with: "3000"
  fill_in "Suburb", with: "Melbourne"
  fill_in "State", with: "VIC"

  click_button "Create User detail"
  expect(page).to have_content("User detail was successfully created.")
end

def create_racquet_successfully
  user_details_successfully
  click_link "Sell"
  click_button "Create Racquet"

  fill_in "Title", with: "One good Racquet"
  fill_in "Description", with: "This is  good Racquet.This is  good Racquet.This is  good Racquet.This is  good Racquet.This is  good Racquet."
  attach_file('Picture', 'app/assets/images/racquets/4.png')
  select "yonex", from: "Brand"
  fill_in "Price", with: "98"

  click_button "Create Racquet"
  expect(page).to have_content("Racquet was successfully created.")
end



RSpec.feature "Create Racquet", type: :feature do

  scenario "creates a racquet unsuccessfully" do
    user_details_successfully
    click_link "Sell"
    click_button "Create Racquet"

    expect(page).to have_content("Brand is not a valid brand")
    expect(page).to have_content("Price is not a number")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "creates a racquet successfully" do
    create_racquet_successfully
    sleep(10)
  end

  scenario "edit a racquet unsuccessfully" do
    create_racquet_successfully
    click_link "My Account"
    click_link "Show Racquet"
    click_link "Edit"

    fill_in "Head size", with: "99"
    # fill_in "Head size in inches", with: "99"

    click_button "Update Racquet"
    expect(page).to have_content("Head size must be greater than 200")
  end

  scenario "edit a racquet unsuccessfully" do
    create_racquet_successfully
    click_link "My Account"
    click_link "Show Racquet"
    click_link "Edit"

    fill_in "Head size", with: "500"

    click_button "Update Racquet"
    expect(page).to have_content("Head size must be less than 450")
  end

  scenario "edit a racquet successfully" do
    create_racquet_successfully
    click_link "My Account"
    click_link "Show Racquet"
    click_link "Edit"

    fill_in "Head size", with: "300"

    click_button "Update Racquet"
    expect(page).to have_content("Racquet was successfully updated.")
  end

end

