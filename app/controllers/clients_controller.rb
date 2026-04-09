class ClientsController < ApplicationController
  def new
    @client = { name: "", email: "", address: { city: "", postcode: "" } }
  end

  def notify
    # @client = Client.new(name: params[:name], email: params[:email])
  end

  def index
    @client = Client.new(name: params[:name], email: params[:email])
    @language = cookies.signed[:preferred_language] || "en"
  end

  def create
     @client = params[:client]  # nested hash from form
    puts @client.inspect
    render :new
  end

  def set_lang
    set_cookie :lang, params[:lang], expires: 1.year.from_now
    cookie.signed[:preferred_lang] = { value: params[:lang], expires: 1.year.from_now }
    redirect_to clients_path
  end

end