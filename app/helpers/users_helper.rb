module UsersHelper
    def is_admin?
      return true if current_user.is_admin? == true
      return false unless current_user.is_admin? == true
    end
end
