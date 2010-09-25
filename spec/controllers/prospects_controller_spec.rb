require "spec_helper"

describe ProspectsController do
  describe "GET 'new'" do
    it "assigns @prospect" do
      prospect = mock_model('Prospect')
      Prospect.should_receive(:new).and_return(prospect)
      get 'new'
      assigns(:prospect).should eq(prospect)
    end
  end
end