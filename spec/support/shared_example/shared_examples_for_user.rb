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
    expect(page).to have_current_path(user_path(User.last))
    expect(current_path).to eq user_path(User.last)
  end
end

# failed
# all blank
shared_examples_for 'fail create user all blank' do
  scenario 'user increment 0' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user, allblank: true)
      click_button '登録'
    end.to change(User, :count).by(0)
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end
#nameblank
shared_examples_for 'fail create user name blank' do
  scenario 'user increment 0' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user, nameblank: true)
      click_button '登録'
    end.to change(User, :count).by(0)
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end
# email blank
shared_examples_for 'fail create user email blank' do
  scenario 'user increment 0' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user, emailblank: true)
      click_button '登録'
    end.to change(User, :count).by(0)
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end
# password blank
shared_examples_for 'fail create user password blank' do
  scenario 'user increment 0' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user, passwordblank: true)
      click_button '登録'
    end.to change(User, :count).by(0)
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end
# password confirmation blank
shared_examples_for 'fail create user password confirmation blank' do
  scenario 'user increment 0' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user, passwordconfirmationblank: true)
      click_button '登録'
    end.to change(User, :count).by(0)
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end
# not unique email
shared_examples_for 'fail create user not unique email' do
  scenario 'user increment 1 not 2' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user)
      click_button '登録'
      visit sign_out_path
      visit new_user_registration_path
      fill_in_signup_form(:user)
      click_button '登録'
    end.to change(User, :count).by(1)
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end
# unmatch password confirmation
shared_examples_for 'fail create user unmatch password' do
  scenario 'user increment 0' do
    expect do
      visit new_user_registration_path
      fill_in_signup_form(:user, unmatchpassword: true)
      click_button '登録'
    end.to change(User, :count).by(0)
    expect(page).to have_title('新規登録 | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: '新規登録')
  end
end