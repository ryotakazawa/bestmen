# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Yahoo! JAPAN' do
  before(:each) do
    visit 'https://www.yahoo.co.jp/'
  end

  it 'タイトルが`Yahoo! JAPAN`であること' do
    expect(page).to have_title('Yahoo! JAPAN')
  end

  it '検索フォームのパーツの要素が存在すること' do
    expect(page).to have_css('#srchfield')
    expect(page).to have_css('input#srchtxt')
    expect(page).to have_css('input.srchbtn')
  end

  it 'ニューストピックスボックスの要素が存在すること' do
    expect(page).to have_xpath("//div[@id='topicsboxbd']")
  end

  it '主なサービスメニュー内に`ヤフオク!`が存在すること' do
    within('#yahooservice') do
      expect(page).to have_content('ヤフオク!')
    end
  end

  context '検索ワードを未入力で検索した時' do
    it '検索結果ページに`ウェブ検索の急上昇ワード`が表示されること' do
      within('#srchbd') do
        fill_in('srchtxt', with: '')
        click_on('検索')
      end
      expect(page).to have_field('yschsp', with: '')
      expect(page).to have_selector('h2', text: 'ウェブ検索の急上昇ワード')
    end
  end

  context '検索ワードに`Selenium Capybara`を入力した時' do
    it '検索結果ページの入力フィールドに検索ワードが入力されていること' do
      within('#srchbd') do
        fill_in('srchtxt', with: 'Selenium Capybara')
        click_on('検索')
      end
      expect(page).to have_field('yschsp', with: 'Selenium Capybara')
    end
  end
end
