Given("I access the bbc registration page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.bbc_homepage.click_go_to_register
end

Given("I select the correct age option") do
  @bbc_site.bbc_registration.click_13_or_over
end

Given("I input an incorrect date of birth") do
  @bbc_site.bbc_registration.enter_incorrect_dob
end

When("I submit the date of birth") do
  @bbc_site.bbc_registration.click_dob_button
end

Then("I receive an error for an incorrect format") do
  expect(@bbc_site.bbc_registration.incorrect_dob).to be true
end

Given("I input a date of birth with the correct format") do
  @bbc_site.bbc_registration.enter_dob
end

Given("I continue to the main registration page") do
  @bbc_site.bbc_registration.click_dob_button
end


Given("I input an invalid email") do
  @bbc_site.bbc_registration.enter_incorrect_email
end

When("I click on to the next input field") do
  @bbc_site.bbc_registration.register_password
end

Then("I receive an error that the email is an invalid format") do
  expect(@bbc_site.bbc_registration.incorrect_email_format_error).to be true
end
