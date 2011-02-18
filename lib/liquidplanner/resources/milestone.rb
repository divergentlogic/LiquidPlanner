module LiquidPlanner
  module Resources
    class Milestone < Leaf

      def timesheet_entries( scope=:all, options={} )
        TimesheetEntry.on("/api/workspaces/:workspace_id/milestones/:milestone_id/").
          find( scope, :params => { :workspace_id => self.prefix_options[:workspace_id], :milestone_id => self.id }.merge(options) )
      end

    end
  end
end
