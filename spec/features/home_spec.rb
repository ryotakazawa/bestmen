# frozen_string_literal: true

require 'rails_helper'

describe 'Home' do
  specify 'タイトルと画面の表示' do
    visit root_path
    expect(page).to have_title 'BESTONE -1番だけをシェアしよう-'
    expect(page).to have_css('h1', text: '- １番じゃなきゃ、ダメなんです。 -')
  end
end

describe 'About' do
  specify 'タイトルと画面の表示' do
    visit about_path
    expect(page).to have_title 'About | BESTONE -1番だけをシェアしよう-'
    expect(page).to have_css('h1', text: 'About')
  end
end
