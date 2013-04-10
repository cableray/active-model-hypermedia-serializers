module ActiveModel
  class HypermediaSerializer < Serializer
    class_attribute :_actions
    self._actions= {}

    def self.action(name, href, method=:get)
      self._actions=_actions.dup
      self._actions[name.to_s]={"href"=>href,"method"=>method.to_s.upcase}
    end
  end
end
