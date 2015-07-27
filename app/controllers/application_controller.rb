class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
      unless session[:user_id]
        flash[:notice] = "Please log in."
        redirect_to(:controller => 'users', :action => 'new')
        return false
      else
        return true
      end
    end

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if html_tag =~ /\<label/
      html_tag
    else
      errors = Array(instance.error_message).join(',')
      %(<span class="validation-error" style="color:red">&nbsp;#{errors}</span>#{html_tag}).html_safe
    end
  end
end
