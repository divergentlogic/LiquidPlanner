module LiquidPlanner
  # For dynamically setting the prefix
  # Idea taken from https://github.com/collectiveidea/pivotal_tracker/blob/master/lib/pivotal_tracker/resource.rb#L18
  module DynamicPrefix
    def on(prefix)
      Class.new(self).tap do |child|
        child.prefix          = prefix
        child.element_name    = self.element_name
        child.collection_name = self.collection_name
        child.primary_key     = self.primary_key
      end
    end
  end
end
