require "spec_helper.rb"

describe "prospects/new.html.erb" do
  let(:prospect) { mock_model('Prospect').as_new_record.as_null_object }

  before do
    assign(:prospect, prospect)
  end

  it "renders form to create a new prospect record" do
    render
    rendered.should have_selector('form', :method => 'post', :action => prospects_path) do |form|
      form.should have_selector('input', :type => 'submit')
    end
  end

  it "renders a labeled textfield for the prospect's firstname" do
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('label', :content => 'Firstname')
      form.should have_selector('input', :type => 'text', :name => 'prospect[firstname]')
    end
  end

  it "renders a labeled textfield for the prospect's email" do
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('label', :content => 'Email')
      form.should have_selector('input', :type => 'text', :name => 'prospect[email]')
    end
  end
end