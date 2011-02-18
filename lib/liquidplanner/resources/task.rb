module LiquidPlanner
  module Resources
    class Task < Leaf

      def timesheet_entries( scope=:all, options={} )
        TimesheetEntry.on("/api/workspaces/:workspace_id/tasks/:task_id/").
          find( scope, :params => { :workspace_id => self.prefix_options[:workspace_id], :task_id => self.id }.merge(options) )
      end

    end
  end
end
