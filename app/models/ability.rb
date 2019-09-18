# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.admin_flg?
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
