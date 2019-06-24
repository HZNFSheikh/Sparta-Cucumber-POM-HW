require 'capybara/dsl'

class BBC_Registration

  include Capybara::DSL


  #Constants

  DAY_DOB_NAME = 'dateOfBirthDay'
  MONTH_DOB_NAME = 'dateOfBirthMonth'
  YEAR_DOB_NAME = 'dateOfBirthYear'

  INCORRECT_FORMAT_EMAIL = 'hsheikh@=spartaglobal.com'


  SUBMIT_BUTTON_ID = '#submit-button'
  SHORT_PASSWORD = 'pass'



  def click_13_or_over
    click_link('13 or over')
    sleep 2
  end

  def enter_dob (day,month,year) 
    fill_in (DAY_DOB_NAME, :with => "#{day}")
    fill_in (MONTH_DOB_NAME, :with => "#{month}")
    fill_in (YEAR_DOB_NAME, :with => "#{year}")
  end

  def enter_incorrect_dob
    fill_in 'dateOfBirthDay', :with => '972'
    fill_in 'dateOfBirthMonth', :with => '14'
    fill_in 'dateOfBirthYear', :with => '1'
  end

  def click_dob_button
    find(SUBMIT_BUTTON_ID).click
    #@session.click_button 'Continue'
    sleep 1
  end

  def enter_email
    fill_in 'email', :with => email
  end

  def enter_incorrect_email
    fill_in 'email', :with => INCORRECT_FORMAT_EMAIL
  end

  def register_password
    fill_in 'password', :with => 'qwerty786!'
  end

  def enter_postcode
    fill_in 'postcode', :with =>'B203EN'
  end

  def choose_gender
    select 'Male', from: 'Gender'
    sleep 1
  end

  def click_opt_out
    all('.button__text-wrapper')[1].click
    sleep 1
  end

  def click_register

    click_link('Register')

  end

  def verify_registration
    has_content?("Thanks. You're now signed in.")
  end

  #Error message methods

  def incorrect_dob
    page.has_content?("Oops, that date doesn't look right.")
  end

  def incorrect_email_format_error
    page.has_content?("Sorry, that email doesn’t look right.")
  end


end
