# frozen_string_literal: true

module SupportModule
  def fill_in_signup_form(user, option = { invalid: false })
    if option[:invalid]
      fill_in 'ユーザーネーム',                                           with: ''
      fill_in 'メールアドレス',                                           with: ''
      fill_in 'パスワード',                                               with: ''
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: ''
    else
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: params[:name]
      fill_in 'メールアドレス',                                           with: params[:email]
      fill_in 'パスワード',                                               with: params[:password]
      fill_in 'パスワード確認(再度パスワードを入力してください)',         with: params[:password]
    end
  end
  
  def fill_in_pic_new_form(pic, option = { invalid: false })
    if option[:invalid]
      
      
      fill_in '住所',                                           with: ''
      fill_in '認定理由',                                       with: ''
    else
      params = attributes_for(pic)
      attach_file '画像',                                       with: params[:image]
      fill_in '住所',                                           with: ''
      select  '醤油',                                           from: 'ジャンル'
      fill_in '認定理由',                                       with: ''
    end
  end
end
