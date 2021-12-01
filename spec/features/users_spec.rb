require 'rails_helper'

RSpec.feature "Users", type: :feature do
    context "Signup new user" do
        before(:each) do
            visit new_user_registration_path
            within("form") do
                fill_in "Email", with: "user@test.com"
            end
        end

        scenario "should create new user" do
            fill_in "Password", with: "testpass"
            fill_in "Password confirmation", with: "testpass"
            click_button "Sign up"
            expect(page).to have_content("Welcome! You have signed up successfully.")
        end

        scenario "should fail - password conformation fails" do
            fill_in "Password", with: "testpass"
            click_button "Sign up"
            expect(page).to have_content("Sign up | Login\nSign up\n1 error prohibited this user from being saved:\nPassword confirmation doesn't match Password\nEmail\nPassword (6 characters minimum)\nPassword confirmation\nLog in")
        end

    end

end