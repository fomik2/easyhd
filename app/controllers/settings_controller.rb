class SettingsController < ApplicationController


  def add_newuser
    render 'devise/registrations/new'
  end
 

end
