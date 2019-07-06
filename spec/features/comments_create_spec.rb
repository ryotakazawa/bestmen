require 'rails_helper'

RSpec.feature 'CommentsCreate', type: :feature do
  include SupportModule

  describe 'signup' do
    before { visit '/users/' }
     it_behaves_like 'signup-form have right css'

    context 'valid info' do
      it_behaves_like 'success create user'
    end

    context 'invalid info' do
      # 失敗 (increment: 0)
      it_behaves_like 'fail create user'
    end
  end
end
