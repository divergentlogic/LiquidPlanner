require 'test/unit'
require 'mocha'
require File.expand_path(File.dirname(__FILE__) + '/../lib/liquidplanner')

class ProjectTest < Test::Unit::TestCase
  def setup
    @email    = 'testing@example.com'
    @password = 'password'
    @lp       = LiquidPlanner::Base.new(:email=>@email, :password=>@password)
    @ws       = LiquidPlanner::Resources::Workspace.new(:id=>1)
  end

  def test_showing_clients
    id = 17
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/projects\/#{id}\.json$/), anything)
      .returns({})

    @ws.projects(id)
  end

  def test_listing_clients
    LiquidPlanner::LiquidPlannerResource.connection
      .expects(:get)
      .with(regexp_matches(/workspaces\/#{@ws.id}\/projects\.json$/), anything)
      .returns([])

    @ws.projects
  end
end
