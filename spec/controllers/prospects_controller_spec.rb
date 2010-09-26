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

  describe "POST 'create'" do
    let(:prospect) { mock_model('Prospect').as_null_object }
    let(:hominid)  { double('Hominid::Base').as_null_object }
    let(:list_id)  { double('Integer') }

    before do
      @user_info = {'firstname' => 'Kenneth', 'email' => 'k@example.com'}
      Prospect.stub(:new).and_return(prospect)
      Hominid::Base.stub(:new).and_return(hominid)
      hominid.stub(:subscribe).and_return(true)
    end

    it "creates a new prospect record" do
      Prospect.should_receive(:new).with(@user_info)
      post 'create', :prospect => @user_info
    end

    context "when the prospect record saves successfully" do
      before do
        prospect.stub(:save).and_return(true)
      end

      it "assigns flash[:notice] a message" do
        post 'create'
        flash[:notice].should eq('Please verify your email address.')
      end

      it "redirects to the index action" do
        post 'create'
        response.should redirect_to(:action => 'index')
      end

      it "subscribes the prospect to a mailing list" do
        hominid.should_receive(:find_list_id_by_name).and_return(list_id)
        hominid.should_receive(:subscribe).with(list_id, prospect.email, {:FNAME => prospect.firstname})
        post 'create'
      end
    end

    context "when the prospect record fails to save" do
      before do
        prospect.stub(:save).and_return(false)
      end

      it "assigns @prospect" do
        post 'create'
        assigns(:prospect).should eq(prospect)
      end

      it "renders the 'new' template" do
        post 'create'
        response.should render_template('new')
      end
    end
  end
end