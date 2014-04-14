class ReasonsController < ApplicationController

  before_action :authenticate_user!

  def create
    @reason = Reason.new(reason_params)
    @reason.list_id = params[:list_id]

    if @reason.save
      flash[:success] = 'Reason was successfully added.'
      redirect_to edit_list_path(params[:list_id])
    else
      flash[:error] = 'There was an error saving. Did you fill in the field?'
      redirect_to edit_list_path(params[:list_id])
    end
  end

  private

    def reason_params
      params.require(:reason).permit(:body, :list_id)
    end

end
