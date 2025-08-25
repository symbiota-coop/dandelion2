class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show]

  def index
    @organisations = Organisation.all.order(created_at: :desc)
  end

  def show
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end
end
