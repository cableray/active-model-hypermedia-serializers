module BuildHelpers
  def def_serializer &block
    Class.new(ActiveModel::HypermediaSerializer, &block)
  end
end
