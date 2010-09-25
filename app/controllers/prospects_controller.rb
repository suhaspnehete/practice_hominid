class ProspectsController < ApplicationController
  def new
    @prospect = Prospect.new
  end
end
