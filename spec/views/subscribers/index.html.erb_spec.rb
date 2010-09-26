require "spec_helper"

describe "subscribers/index.html.erb" do
  let(:subscribers) {[
      {'First_Name' => 'Kenneth', 'Email' => 'k@example.com'},
      {'First_Name' => 'Another', 'Email' => 'a@example.com'}
    ]}

  before do
    assign(:subscribers, subscribers)
  end

  it "renders table to display all subscribers of a mailing list" do
    render
    rendered.should have_selector('table') do |table|
      table.should have_selector('tr th', :content => 'Firstname')
      table.should have_selector('tr th', :content => 'Email')
    end
  end

  it "renders the firstnames and emails of all subscribers" do
    render
    subscribers.each do |s|
      rendered.should have_selector('tr td', :content => s[:First_Name])
      rendered.should have_selector('tr td', :content => s[:Email])
    end
  end
end