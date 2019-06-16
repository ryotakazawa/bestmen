require 'rails_helper'


RSpec.describe 'staticPages', type: :system do

  it '正しい画面とタイトルを表示する' do
    visit '/static_pages/home'
    expect(page).to have_css('h1', text: 'BESTONE')
  end
end