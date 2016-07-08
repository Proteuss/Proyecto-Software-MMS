class Intento1Controller < ApplicationController
  def i1
     @zeldas = []
     @nombres = []
     @q = params[:q]
    agent = Mechanize.new
    page = agent.get('http://arpa.ucv.cl/dic/')
    form = page.forms.first
    form['buscar'] = params[:q]
    page = form.submit
    page.search('#contenido h2 a').each do |h2|
    #@zeldas = h2.attributes["href"]
    #@nombres = h2.text.strip
    @nombres.push(h2.text.strip)
    @zeldas.push(h2.attributes["href"])
    end
  end
end
