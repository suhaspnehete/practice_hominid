class ProspectsController < ApplicationController
  def new
    @prospect = Prospect.new
  end

  def create
    @prospect = Prospect.new(params[:prospect])
    if @prospect.save
      flash[:notice] = 'Please verify your email address.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
end
