class NoticiasController < ApplicationController
  def index
  	@noticias = Noticia.all
  end
  def show
    @noticia = Noticia.find(params[:id])
  end
end
