# frozen_string_literal: true

# comment
# comments#new
# view test
shared_examples_for 'comment-form have right css' do
  it { expect(page).to have_css('label', text: 'コメントする') }
  it { expect(page).to have_css('input#comment_content') }
end

# comments
# comments#create
# success
shared_examples_for 'success create comment' do
  scenario 'comment increment 1' do
    expect do
      fill_in_comment_create_form(:comment)
      click_button '送信'
      sleep 0.5
    end.to change(Comment, :count).by(1)
  end
end
# failed
# content blank
shared_examples_for 'fail create comment content blank' do
  scenario 'comment increment 0' do
    expect do
      fill_in_comment_create_form(:comment, contentblank: true)
      click_button '送信'
      sleep 0.5
    end.to change(Comment, :count).by(0)
  end
end
# comments#delete
# success
shared_examples_for 'success delete comment' do
  scenario 'comment decrement 1' do
    expect do
      click_link '削除'
    end.to change(Comment, :count).by(0)
  end
end
