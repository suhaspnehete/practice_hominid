class ProspectsController < ApplicationController
  def new
    @prospect = Prospect.new
  end

  def create
    @prospect = Prospect.new(params[:prospect])
    if @prospect.save
      subscribe(@prospect)
      flash[:notice] = 'Please verify your email address.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  private

  def subscribe(prospect)
    h = Hominid::Base.new(:api_key => '0f9707027cec5d61e8122b605cd930e1-us1')
    h.subscribe(h.find_list_id_by_name("NMPH Clients"), prospect.email, {:FNAME => prospect.firstname})
  end
end
