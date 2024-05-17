class SessionsController < ApplicationController
  before_action :load_client

  def new
    @session = Session.new(callback_url: @client.callback_url, client_name: @client.name)
  end

  def create
    @user = @client.users.find_by(username: session_params[:username]).authenticate(session_params[:password])
    if @user
      @session = Session.create(user: @user, active: true)
      signed_id = @session.to_sgid(expires_in: 10.minutes, for: 'auth').to_s
      @session.update(last_key: signed_id)
      redirect_to "#{@client.callback_url}?auth=#{signed_id}", external: true
    else
      flash[:notice] = "#{@client.name} error: Invalid username or password"
      redirect_to :new, params: @client.slice(:callback_url)
    end
  end

  def destroy
    @session = SignedGlobalID.find(params[:id]) || Session.find_by(last_key: params[:id])
    @session = @client.sessions.find_by(id: @session&.id) if @session
    @session&.update(active: false)
    render json: {success: true}
  end

  private
  def load_client
    @client = Client.find_by(callback_url: params[:callback_url])
  end
  def session_params
    params.require(:session).permit(:username, :password, :callback_url)
  end
end
