Given("I access the bbc login page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
end

Given("I input incorrect username details") do
  @bbc_site.bbc_login.fill_wrong_email

end

Given(/^I input incorrect password details (.*)$/) do |password|
  @bbc_site.bbc_login.fill_password(password)
end

When("I try to Login") do
  @bbc_site.bbc_login.click_submit
end

Then("I receive an error") do
  expect(@bbc_site.bbc_login.incorrect_email_error).to be true
end

Given("I input correct username details") do
  @bbc_site.bbc_login.fill_email
end

Then(/^I receive the following error: (.*)/) do |error|
  expect(@bbc_site.bbc_login.password_error_message).to eq "#{error}"
end
