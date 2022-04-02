class ZonesController < ApplicationController
  before_action :set_zone, only: [:show]

  # GET /zones/1
  def show
    @next_fixtures = Fixture.fornight.where(zone_id: @zone.id)
    #@next_fixtures = Fixture.where(zone_id: @zone.id).order(start_time: :asc).take(2)
    @fixtures = Fixture.where(zone_id: @zone.id).order(start_time: :asc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_zone
    @zone = Zone.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def zone_params
    params.fetch(:zone, {})
  end
end
