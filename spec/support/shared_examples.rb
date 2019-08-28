# frozen_string_literal: true

# user
# users#new
# view test
shared_examples_for 'signup-form have right css' do
  it { expect(page).to have_css('label', text: 'ユーザーネーム') }
  it { expect(page).to have_css('label', text: 'メールアドレス') }
  it { expect(page).to have_css('label', text: 'パスワード') }
  it { expect(page).to have_css('label', text: 'パスワード確認(再度パスワードを入力してください)') }
  it { expect(page).to have_css('input#user_name') }
  it { expect(page).to have_css('input#user_email') }
  it { expect(page).to have_css('input#user_password') }
  it { expect(page).to have_css('input#user_password_confirmation') }
  it { expect(page).to have_button('登録') }
end

# signup
# users#create
# success
shared_examples_for 'success create user' do
  scenario 'user increment 1' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user) # => SupportModule を使用
      click_button '登録'
    end.to change(User, :count).by(1)
    # メッセージ
    #expect(page).to have_css('div.alert.alert-success', text: 'Welcome to the BESTONE!')
    # ユーザープロフィールへredirect
    expect(page).to have_current_path(user_path(User.last))
    expect(current_path).to eq user_path(User.last)
  end
end
# failed
shared_examples_for 'fail create user' do
  scenario 'user increment 0' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user, invalid: true) # => SupportModule を使用
      click_button '登録'
    end.to change(User, :count).by(0)
    # メッセージ
    #expect(page).to have_css('div.alert.alert-danger', text: 'errors')
    # サインアップページがrender
    expect(page).to have_title('新規登録 | BESTONE -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end

# pic
# pics#new
# view test
shared_examples_for 'new_pic-form have right css' do
  it { expect(page).to have_css('label', text: '画像') }
  it { expect(page).to have_css('label', text: '店名') }
  it { expect(page).to have_css('label', text: '説明') }
  it { expect(page).to have_css('input#pic_image') }
  it { expect(page).to have_css('input#pic_name') }
  it { expect(page).to have_css('input#pic_description') }
  it { expect(page).to have_button('登録する') }
end

# pics
# picss#create
# success
shared_examples_for 'success create pic' do
  scenario 'pic increment 1' do
    expect do
      visit new_pic_path
      fill_in_pic_new_form(:pic) # => SupportModule を使用
      click_button '登録する'
    end.to change(Pic, :count).by(1)
    # メッセージ
    #expect(page).to have_css('div.alert.alert-success', text: 'Welcome to the BESTONE!')
    # ユーザープロフィールへredirect
    expect(page).to have_current_path(pic_path(Pic.last))
    expect(current_path).to eq pic_path(Pic.last)
  end
end
# failed
shared_examples_for 'fail create pic' do
  scenario 'user increment 0' do
    expect do
      visit new_pic_path
      fill_in_pic_new_form(:pic, invalid: true) # => SupportModule を使用
      click_button '登録する'
    end.to change(Pic, :count).by(0)
    # メッセージ
    #expect(page).to have_css('div.alert.alert-danger', text: 'errors')
    # サインアップページがrender
    expect(page).to have_title('認定する | BESTONE -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '認定する')
  end
end