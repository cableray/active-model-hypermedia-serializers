require 'spec_helper'

describe ActiveModel::HypermediaSerializer do
  describe "serializer with specified actions"
  subject do
    @serializer=def_serializer {
      attributes :id
      action "show", "show/me", :get
      root false
    }
    @serializer.new({id:666}).as_json
  end
  it {should include "resource"}
  it {should include "actions"}
  it {should have_length(1).at_path("actions")}
end
