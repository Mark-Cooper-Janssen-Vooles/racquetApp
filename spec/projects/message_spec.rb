require 'rails_helper'

#to run:
# rspec spec/projects/message_spec.rb

def sign_up_successfully_cat
  visit "/"
  click_link "Login"
  click_link "Sign up"

  fill_in "Email", with: "cat@user.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"

  click_button "Sign up"
end

def sign_up_successfully_dog
  visit "/"
  click_link "Login"
  click_link "Sign up"

  fill_in "Email", with: "dog@user.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"

  click_button "Sign up"
end

def user_details_successfully_cat
  fill_in "Name", with: "cat"
  fill_in "Description", with: "The snake market place had lots of cartoon snakes"
  attach_file('Picture', 'app/assets/images/users/cat.png')
  fill_in "State", with: "VIC"
  fill_in "Suburb", with: "MELBOURNE"
  fill_in "Postcode", with: "3000"

  click_button "Create User detail"
  expect(page).to have_content("User detail was successfully created.")
end

def user_details_successfully_dog
  fill_in "Name", with: "dog"
  fill_in "Description", with: "The snake market place had lots of cartoon snakes"
  attach_file('Picture', 'app/assets/images/users/dog1.png')
  fill_in "State", with: "VIC"
  fill_in "Suburb", with: "MELBOURNE"
  fill_in "Postcode", with: "3000"
 

  click_button "Create User detail"
  expect(page).to have_content("User detail was successfully created.")
end


RSpec.feature "Message between users", type: :feature do
  scenario "message successfully as cat" do
    sign_up_successfully_dog
    user_details_successfully_dog

    click_link "Logout"
    
    sign_up_successfully_cat
    user_details_successfully_cat

    click_link "Inbox"

    click_link "dog@user.com"

    fill_in 'message_body', with: 'Hello dog, this is cat.'
    click_button 'Send'
    expect(page).to have_content("Hello dog, this is cat.")
    sleep(5)
    click_link "Logout"
    click_link "Login"

    fill_in "Email", with: "dog@user.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    click_link "Inbox"
    # click_link "cat@user.com"
    first(:link, "cat@user.com").click
    fill_in 'message_body', with: "Hi Cat. I am dog."
    click_button 'Send'
    sleep(5)
    fill_in 'message_body', with: "I like to chase balls around the park."
    click_button 'Send'
    sleep(5)
    fill_in 'message_body', with: "My owner needs a new tennis racquet to hit me tennis balls."
    click_button 'Send'
    sleep(5)
    click_button 'Send'
    expect(page).to have_content("Hi Cat. I am dog.")

    click_link "Logout"
    click_link "Login"

    fill_in "Email", with: "cat@user.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_link "Inbox"
    first(:link, "dog@user.com").click
    fill_in 'message_body', with: "I don't sell tennis racquets for that purpose."
    click_button 'Send'
    sleep(5)
    fill_in 'message_body', with: "Please stop talking to me now."
    click_button 'Send'
    sleep(5)
    expect(page).to have_content("Please stop talking to me now.")
  end

end