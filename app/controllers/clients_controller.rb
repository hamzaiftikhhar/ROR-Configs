class ClientsController < ApplicationController
  def new
  end

  def notify
  end
  
  def index
    @client = Client.new(name: params[:name], email: params[:email])
  end

  def create
    @client = Client.new(params.require(:client).permit(:name, :email))
    if @client.save
      redirect_to clients_path(name: @client.name, email: @client.email)
    else
      render :index
    end
  end

end