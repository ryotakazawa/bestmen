# frozen_string_literal: true

# comment
# comments#new
# view test
shared_examples_for 'comment-form have right css' do
  it { expect(page).to have_css('label', text: '店名') }
  it { expect(page).to have_css('label', text: '画像') }
  it { expect(page).to have_css('label', text: '住所') }
  it { expect(page).to have_css('label', text: 'ジャンル') }
  it { expect(page).to have_css('label', text: '認定理由') }
  it { expect(page).to have_css('input#pic_title') }
  it { expect(page).to have_css('input#pic_image') }
  it { expect(page).to have_css('input#pic_address') }
  it { expect(page).to have_button('登録する') }
end

# pics
# picss#create
# success
shared_examples_for 'success create pic' do
  scenario 'pic increment 1' do
    expect do
      fill_in_pic_new_form(:pic)
      click_button '登録する'
    end.to change(Pic, :count).by(1)
    # メッセージ
    # expect(page).to have_css('div.alert.alert-success', text: 'Welcome to the BESTONE!')
    # ユーザープロフィールへredirect
    expect(page).to have_current_path(pic_path(Pic.last))
    expect(current_path).to eq pic_path(Pic.last)
  end
end
# failed
# name blank
shared_examples_for 'fail create pic name blank' do
  scenario 'user increment 0' do
    expect do
      fill_in_pic_new_form(:pic, nameblank: true)
      click_button '登録する'
    end.to change(Pic, :count).by(0)
    expect(page).to have_title('認定する | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '認定する')
  end
end
# tag_list blank
shared_examples_for 'fail create pic tag_list blank' do
  scenario 'user increment 0' do
    expect do
      fill_in_pic_new_form(:pic, taglistblank: true)
      click_button '登録する'
    end.to change(Pic, :count).by(0)
    expect(page).to have_title('認定する | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '認定する')
  end
end