require "spec_helper"

describe "prospects/index.html" do
  it "displays flash[:notice] if available" do
    flash[:notice] = 'Please verify your email address.'
    render
    rendered.should contain('Please verify your email address.')
  end
end