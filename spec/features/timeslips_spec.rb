require 'rails_helper'

RSpec.feature "Timeslips", type: :feature do

  scenario 'Got to timeslips management and add new timeslip' do
    visit '/'
    click_on 'Timeslips'
  end
end
