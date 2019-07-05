require 'rails_helper'

RSpec.feature 'PicsCreate', type: :feature do
  include SupportModule

  describe 'create' do
    before { visit '/pics/new' }

    context 'valid info' do
      it_behaves_like 'success create pic'
    end

    context 'fail create pic' do
      # 失敗 (increment: 0)
      it_behaves_like 'fail create pic'
    end
  end
end
