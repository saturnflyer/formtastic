# encoding: utf-8
require 'spec_helper'

describe 'phone input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe "when object is provided" do
    before do
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:phone))
      end)
    end

    it_should_have_input_wrapper_with_class(:phone)
    it_should_have_input_wrapper_with_id("post_phone_input")
    it_should_have_label_with_text(/Phone/)
    it_should_have_label_for("post_phone")
    it_should_have_input_with_id("post_phone")
    it_should_have_input_with_type(:tel)
    it_should_have_input_with_name("post[phone]")

  end

  describe "when namespace is provided" do

    before do
      concat(semantic_form_for(@new_post, :namespace => "context2") do |builder|
        concat(builder.input(:phone))
      end)
    end

    it_should_have_input_wrapper_with_id("context2_post_phone_input")
    it_should_have_label_and_input_with_id("context2_post_phone")

  end

end

