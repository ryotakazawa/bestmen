# frozen_string_literal: true

module SupportModule
  def fill_in_signup_form(user, option = { invalid: false })
    if option[:invalid]
      fill_in 'ユーザーネーム',                                           with: ''
      fill_in 'メールアドレス',                                           with: ''
      fill_in 'パスワード',                                               with: ''
      fill_in 'パスワード確認(もう一度同じパスワードを入力してください)', with: ''
    else
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'ユーザーネーム',                                           with: params[:name]
      fill_in 'メールアドレス',                                           with: params[:email]
      fill_in 'パスワード',                                               with: params[:password]
      fill_in 'パスワード確認(もう一度同じパスワードを入力してください)', with: params[:password]
    end
  end
  
  def fill_in_pic_new_form(pic, option = { invalid: false })
    if option[:invalid]
      attach_file '画像',                                       with: ''
      fill_in 'pic_title',                                      with: ''
      fill_in '選考理由',                                       with: ''
    else
      params = attributes_for(pic)
      attach_file '画像',                                       with: params[:image]
      fill_in 'pic_title',                                      with: params[:title]
      fill_in '選考理由',                                       with: params[:description]
    end
  end
end
