# frozen_string_literal: true

# pic
# pics#new
# view test
shared_examples_for 'new_pic-form have right css' do
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

# pics#create
# success
shared_examples_for 'success create pic' do
  scenario 'pic increment 1 and show correct veiw' do
    expect do
      fill_in_pic_new_form(:pic)
      click_button '登録する'
    end.to change(Pic, :count).by(1)
    expect(page).to have_current_path(pic_path(Pic.last))
    expect(current_path).to eq pic_path(Pic.last)
    # view
    expect(page).to have_css('h1', text: 'MyString')
    expect(page).to have_css('a', text: 'testuser1')
    expect(page).to have_content('港区芝公園４丁目２−８')
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

# pics#edit
# view test
shared_examples_for 'edit_pic-form have right css' do
  it { expect(page).to have_css('label', text: '店名') }
  it { expect(page).to have_css('label', text: '画像') }
  it { expect(page).to have_css('label', text: '住所') }
  it { expect(page).to have_css('label', text: 'ジャンル') }
  it { expect(page).to have_css('label', text: '認定理由') }
  it { expect(page).to have_css('input#pic_title') }
  it { expect(page).to have_css('input#pic_image') }
  it { expect(page).to have_css('input#pic_address') }
  it { expect(page).to have_button('更新する') }
end

# pics#edit
# success
shared_examples_for 'success edit pic' do
  scenario 'edit pic and show correct veiw' do
    fill_in_pic_edit_form(:pic)
    click_button '更新する'
    expect(page).to have_current_path(pic_path(pic))
    expect(current_path).to eq pic_path(pic)
    # view
    expect(page).to have_css('h1', text: 'MyString')
    expect(page).to have_css('a', text: 'testuser1')
    expect(page).to have_content('最高！！')
  end
end
# failed
# name blank
shared_examples_for 'fail edit pic name blank' do
  scenario 'edit fail because name blank' do
    fill_in_pic_edit_form(:pic, nameblank: true)
    click_button '更新する'
    expect(page).to have_css('h1', text: '編集')
  end
end

# tag_list blank
shared_examples_for 'fail edit pic tag_list blank' do
  scenario 'edit fail because tag_list blank' do
    fill_in_pic_edit_form(:pic, taglistblank: true)
    click_button '更新する'
    expect(page).to have_css('h1', text: '編集')
  end
end

# pics#delete
# success
shared_examples_for 'success delete pic' do
  scenario 'success delete pic and show correct veiw' do
    click_link '削除'
    page.accept_confirm '一度削除した投稿は復元できません。よろしいですか？'
    expect(page).to have_current_path(pics_path)
    # view
    expect(page).to have_css('h1', text: '名店一覧')
  end
end
# fail
shared_examples_for 'fail delete pic' do
  scenario 'pic delete fail and show correct veiw' do
    click_link '削除'
    page.accept_confirm '一度削除した投稿は復元できません。よろしいですか？'
    expect(page).to have_current_path(pics_path)
    # view
    expect(page).to have_css('h1', text: '名店一覧')
  end
end
