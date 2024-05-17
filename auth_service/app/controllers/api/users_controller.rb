class Api::UsersController < ApplicationController
  def show
    @session = SignedGlobalID.find(params[:id])
    if @session
      render json: {user: @session.user.slice(:email, :name), client: @session.user.client.slice(:name)}
    else
      render json: {status: 'Invalid or expired id'}, status: 404
    end
  end
end
