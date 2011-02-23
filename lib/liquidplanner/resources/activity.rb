module LiquidPlanner
  module Resources
    class Activity < LiquidPlanner::LiquidPlannerResource
      self.prefix = "/api/workspaces/:workspace_id/"
    end
  end
end
