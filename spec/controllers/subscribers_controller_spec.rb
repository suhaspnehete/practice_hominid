require "spec_helper"

describe SubscribersController do
  describe "GET 'index'" do
    let(:hominid) { double('Hominid::Base') }
    let(:list_id) { double('Integer') }
    let(:subscribers) do
      [
        {'First_Name' => 'Kenneth', 'Email' => 'k@example.com'},
        {'First_Name' => 'Another', 'Email' => 'a@example.com'}
      ]
    end

    before do
      Hominid::Base.stub(:new).and_return(hominid)
      hominid.stub(:find_list_id_by_name).and_return(list_id)
      hominid.stub(:export).and_return(subscribers)
    end

    it "connects to MailChimp using MailChimp's API wrapped in Hominid" do
      Hominid::Base.should_receive(:new).with(:api_key => '0f9707027cec5d61e8122b605cd930e1-us1')
      get 'index'
    end

    it "queries MailChimp for all subscribers of a particular list" do
      hominid.should_receive(:export).with(list_id)
      get 'index'
    end

    it "assigns @subscribers" do
      get 'index'
      assigns(:subscribers).should eq(subscribers)
    end
  end
end
