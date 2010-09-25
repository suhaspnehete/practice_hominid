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

    before do
      Prospect.stub(:new).and_return(prospect)
    end

    it "creates a new prospect record" do
      Prospect.should_receive(:new).with('firstname' => 'Kenneth', 'email' => 'k@example.com')
      post 'create', :prospect => {'firstname' => 'Kenneth', 'email' => 'k@example.com'}
    end
    
    it "saves that record" do
      prospect.should_receive(:save)
      post 'create'
    end

    context "when the prospect record saves successfully" do
      before do
        prospect.stub(:save).and_return(true)
      end

      it "assings flash[:notice] a message" do
        post 'create'
        flash[:notice].should eq('Please verify your email address.')
      end

      it "redirects to the index action" do
        post 'create'
        response.should redirect_to(:action => 'index')
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