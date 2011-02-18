require 'test/unit'
require 'mocha'
require File.expand_path(File.dirname(__FILE__) + '/../lib/liquidplanner')

class TimesheetEntryTest < Test::Unit::TestCase
  def setup
    @email    = 'testing@example.com'
    @password = 'password'
    @lp       = LiquidPlanner::Base.new(:email=>@email, :password=>@password)
    @ws       = LiquidPlanner::Resources::Workspace.new(:id=>1)
    @task     = LiquidPlanner::Resources::Task.new(:id=>1, :workspace_id=>@ws.id)
    @event    = LiquidPlanner::Resources::Event.new(:id=>1, :workspace_id=>@ws.id)
    @ms       = LiquidPlanner::Resources::Milestone.new(:id=>1, :workspace_id=>@ws.id)
  end

  def test_showing_workspace_timesheet_entries
    id = 17
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/timesheet_entries\/#{id}\.json$/), anything)
      .returns({})

    @ws.timesheet_entries(id)
  end

  def test_listing_workspace_timesheet_entries
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/timesheet_entries\.json$/), anything)
      .returns([])

    @ws.timesheet_entries
  end

  def test_showing_task_timesheet_entries
    id = 17
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/tasks\/#{@task.id}\/timesheet_entries\/#{id}\.json$/), anything)
      .returns({})

    @task.timesheet_entries(id)
  end

  def test_listing_task_timesheet_entries
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/tasks\/#{@task.id}\/timesheet_entries\.json$/), anything)
      .returns([])

    @task.timesheet_entries
  end

  def test_showing_event_timesheet_entries
    id = 17
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/events\/#{@event.id}\/timesheet_entries\/#{id}\.json$/), anything)
      .returns({})

    @event.timesheet_entries(id)
  end

  def test_listing_event_timesheet_entries
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/events\/#{@event.id}\/timesheet_entries\.json$/), anything)
      .returns([])

    @event.timesheet_entries
  end

  def test_showing_milestone_timesheet_entries
    id = 17
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/milestones\/#{@ms.id}\/timesheet_entries\/#{id}\.json$/), anything)
      .returns({})

    @ms.timesheet_entries(id)
  end

  def test_listing_milestone_timesheet_entries
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/milestones\/#{@ms.id}\/timesheet_entries\.json$/), anything)
      .returns([])

    @ms.timesheet_entries
  end
end
