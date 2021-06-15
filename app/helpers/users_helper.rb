module UsersHelper
    def is_admin?
      true if current_user.is_admin == true
    end
end
