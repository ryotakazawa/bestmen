require 'rails_helper'

describe 'Home' do
  specify 'タイトルと画面の表示' do
    visit '/static_pages/home'
    expect(page).to have_title 'BESTONE -1番だけをシェアしよう-'
    expect(page).to have_css('h1', text: 'BESTONE')
  end
end

describe 'About' do
  specify 'タイトルと画面の表示' do
    visit '/static_pages/about'
    expect(page).to have_title 'About | BESTONE -1番だけをシェアしよう-'
    expect(page).to have_css('h1', text: 'About')
  end
end