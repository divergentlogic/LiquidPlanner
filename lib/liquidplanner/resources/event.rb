module LiquidPlanner
  module Resources
    class Event < Leaf

      def timesheet_entries( scope=:all, options={} )
        TimesheetEntry.on("/api/workspaces/:workspace_id/events/:event_id/").
          find( scope, :params => { :workspace_id => self.prefix_options[:workspace_id], :event_id => self.id }.merge(options) )
      end

    end
  end
end
