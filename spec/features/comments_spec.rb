# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  include SupportModule
  include_context 'setup'

  before do
    login_as(user)
    visit pic_path(pic)
    click_link 'コメント'
  end

  describe 'CreateComment' do
    it_behaves_like 'comment-form have right css'

    context 'valid info' do
      it_behaves_like 'success create comment'
    end

    context 'fail create comment (content blank)' do
      it_behaves_like 'fail create comment content blank'
    end
  end

  describe 'DeleteComment' do
    before do
      Comment.create(content: 'MyString', pic_id: 1, user_id: 1)
    end

    context 'tap delete' do
      it_behaves_like 'success delete comment'
    end
  end
end
