require 'spec_helper'

describe Prospect do
  before do
    @prospect = Prospect.new
  end

  it "responds to 'firstname'" do
    @prospect.should respond_to('firstname')
  end

  it "responds to 'email'" do
    @prospect.should respond_to('email')
  end
end
