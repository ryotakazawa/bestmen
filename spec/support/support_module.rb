# frozen_string_literal: true

module SupportModule
  def fill_in_signup_form(user, option = { invalid: false })
    if option[:allblank]
      fill_in 'ユーザーネーム',                                           with: ''
      fill_in 'メールアドレス',                                           with: ''
      fill_in 'パスワード',                                               with: ''
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: ''
    elsif option[:nameblank]
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: ''
      fill_in 'メールアドレス',                                           with: params[:email]
      fill_in 'パスワード',                                               with: params[:password]
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: params[:password]
    elsif option[:emailblank]
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: params[:name]
      fill_in 'メールアドレス',                                           with: ''
      fill_in 'パスワード',                                               with: params[:password]
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: params[:password]
    elsif option[:passwordblank]
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: params[:name]
      fill_in 'メールアドレス',                                           with: params[:email]
      fill_in 'パスワード',                                               with: ''
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: params[:password]
    elsif option[:passwordconfirmationblank]
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: params[:name]
      fill_in 'メールアドレス',                                           with: params[:email]
      fill_in 'パスワード',                                               with: params[:password]
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: params[:password]
    elsif option[:unmatchpassword]
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: params[:name]
      fill_in 'メールアドレス',                                           with: params[:email]
      fill_in 'パスワード',                                               with: params[:password]
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: '123abc'
    else 
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: params[:name]
      fill_in 'メールアドレス',                                           with: params[:email]
      fill_in 'パスワード',                                               with: params[:password]
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: params[:password]
    end
  end

  def fill_in_pic_new_form(pic, option = { invalid: false })
    if option[:taglistblank]
      params = attributes_for(pic)
      fill_in '店名',                with: params[:title]
      attach_file('pic_image', "spec/fixtures/test.jpg")
      fill_in '住所',                with: params[:address]
      fill_in '認定理由',            with: params[:description]
    elsif option[:nameblank]
      params = attributes_for(pic) 
      fill_in '店名',                with: ''
      attach_file('pic_image', "spec/fixtures/test.jpg")
      fill_in '住所',                with: params[:address]
      select  '醤油',                from: 'ジャンル'
      fill_in '認定理由',            with: params[:description]
    else
      params = attributes_for(pic)
      fill_in '店名',                with: params[:title]
      attach_file('pic_image', "spec/fixtures/test.jpg")
      fill_in '住所',                with: params[:address]
      select  '醤油',                from: 'ジャンル'
      fill_in '認定理由',            with: params[:description]
    end
  end
  
  def fill_in_login_form(user, option = { invalid: false })
    if option[:allblank]
      fill_in 'メールアドレス',      with: ''
      fill_in 'パスワード',          with: ''
    elsif option[:emailblank]
      params = attributes_for(user)
      fill_in 'メールアドレス',      with: ''
      fill_in 'パスワード',          with: params[:password]
    elsif option[:passwordblank]
      params = attributes_for(user)
      fill_in 'メールアドレス',      with: params[:email]
      fill_in 'パスワード',          with: ''
    elsif option[:unmatchpassword]
      params = attributes_for(user)
      fill_in 'メールアドレス',      with: params[:email]
      fill_in 'パスワード',          with: 'abcdef'
    else
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'メールアドレス',      with: params[:email]
      fill_in 'パスワード',          with: params[:password]
    end
  end
  
  def login_as(user)
    visit new_user_session_path
    fill_in 'メールアドレス',        with: user.email
    fill_in 'パスワード',            with: user.password
    click_button "ログイン"
  end
end
