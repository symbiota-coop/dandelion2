class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show]

  def index
    @organisations = Organisation.all.order(created_at: :desc)
  end

  def show
    @events = @organisation.events.order(start_time: :desc).limit(20)
  end

  private

  def set_organisation
    @organisation = Organisation.fs(params[:slug])
  end
end
