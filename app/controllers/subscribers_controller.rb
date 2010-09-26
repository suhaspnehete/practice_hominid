class SubscribersController < ApplicationController
  def index
    h = Hominid::Base.new(:api_key => "0f9707027cec5d61e8122b605cd930e1-us1")
    @subscribers = h.export(h.find_list_id_by_name("NMPH Clients"))
  end
end
