require 'htmlentities'
require "mechanize"

mechanize = Mechanize.new
		@busqueda = params[:busqueda]
		b = URI.encode(@busqueda)
		@resMemoria = Hash.new



puts "\n\nBuscando en memoriachilena.cl...\n\n"
		browser = Watir::Browser.new :phantomjs
		browser.goto "http://www.memoriachilena.cl/602/w3-propertyvalue-137757.html?_q=offset%3D0%26limit%3D300%26cid%3D502%26keywords%3D"+ b +"%26stageid%3D100%26searchmode%3Dpartial%26pvid_or%3D509%3A158494%2C26262%2C1224%2C616%2C137551"
		begin
			pagina = Nokogiri::HTML.parse(browser.html)
			titulos = pagina.xpath("//div/h4/a")
		end while titulos.length == 0

		titulos.each do |titulo|
			@resMemoria[titulo.attribute("title").to_s] = "http://www.memoriachilena.cl/602/" + titulo.attribute("href").to_s
		end