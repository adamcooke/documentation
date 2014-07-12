module Documentation
  class Authorizer
    
    def initialize(controller)
      @controller = controller
    end
    
    def can_view_page?(page)
      true
    end

    def can_add_page?(page)
      true
    end

    def can_reposition_page?(page)
      true
    end

    def can_delete_page?(page)
      true
    end

    def can_edit_page?(page)
      true
    end
    
    def check!(action, object)
      action_method_name = "can_#{action}?"
      if self.respond_to?(action_method_name)
        if self.send(action_method_name, object) != true
          raise Documentation::AccessDeniedError, "You are not permitted to perform this action."
        end
      else
        raise Documentation::Error, "Invalid authorizer check (#{action})"
      end
    end
    
    private
    
    def request
      controller.request
    end
    
    
  end
end