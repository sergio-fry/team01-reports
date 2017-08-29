require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  scenario 'Welcome page is working' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end
end
