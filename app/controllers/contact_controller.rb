class ContactController < ApplicationController

  def new

  end

  def create
    @name = params[:name]
    redirect_to contact_path({ name: params[:name] })

  end

end
