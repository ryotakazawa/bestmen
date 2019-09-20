# frozen_string_literal: true

# user
# sessions#new
# view test
shared_examples_for 'login-form have right css' do
  it { expect(page).to have_css('label', text: 'メールアドレス') }
  it { expect(page).to have_css('label', text: 'パスワード') }
  it { expect(page).to have_css('input#user_email') }
  it { expect(page).to have_css('input#user_password') }
  it { expect(page).to have_button('ログイン') }
  it { expect(page).to have_button('かんたんログイン') }
end

# sign_in
# users#sign_in
# success
shared_examples_for 'success login user' do
  scenario 'success login user' do
    expect do
      visit new_user_session_path
      fill_in_login_form(:user) # => SupportModule を使用
      click_button 'ログイン'
    end
  end
end
# fail
# all blank
shared_examples_for 'fail login user all blank' do
  scenario 'fail login user all blank' do
    expect do
      visit new_user_session_path
      fill_in_login_form(:user, allblank: true) # => SupportModule を使用
      click_button 'ログイン'
    end
    expect(page).to have_title('ログイン | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: 'ログイン')
  end
end
# email blank
shared_examples_for 'fail login user email blank' do
  scenario 'fail login user email blank' do
    expect do
      visit new_user_session_path
      fill_in_login_form(:user, emailblank: true) # => SupportModule を使用
      click_button 'ログイン'
    end
    expect(page).to have_title('ログイン | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: 'ログイン')
  end
end
# password blank
shared_examples_for 'fail login user password blank' do
  scenario 'fail login user password blank' do
    expect do
      visit new_user_session_path
      fill_in_login_form(:user, passwordblank: true) # => SupportModule を使用
      click_button 'ログイン'
    end
    expect(page).to have_title('ログイン | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: 'ログイン')
  end
end
# unmatch password
shared_examples_for 'fail login user unmatch password' do
  scenario 'fail login user unmatch password' do
    expect do
      visit new_user_session_path
      fill_in_login_form(:user, unmatchpassword: true) # => SupportModule を使用
      click_button 'ログイン'
    end
    expect(page).to have_title('ログイン | BESTMEN -1番だけをシェアしよう-')
    expect(page).to have_css('h1', text: 'ログイン')
  end
end