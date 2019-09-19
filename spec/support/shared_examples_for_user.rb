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
    # expect(page).to have_css('div.alert.alert-success', text: 'Welcome to the BESTONE!')
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
    # expect(page).to have_css('div.alert.alert-danger', text: 'errors')
    # サインアップページがrender
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end
