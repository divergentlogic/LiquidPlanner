module LiquidPlanner
  module Resources
    class TimesheetEntry < LiquidPlanner::LiquidPlannerResource
      extend DynamicPrefix
      self.prefix = "/api/workspaces/:workspace_id/"
    end
  end
end
