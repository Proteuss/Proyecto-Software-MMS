class EmailapiController < ApplicationController
  def index
  	@email=current_user.email
  	gibbon = Gibbon::Request.new
  	categories=gibbon.lists("c37ad8771c").interest_categories.retrieve
  	@interests=gibbon.lists("c37ad8771c").interest_categories(categories["categories"][0]["id"]).interests.retrieve
  	@sizeInterests=@interests["interests"].count
  	@interestList=Array.new(@sizeInterests)
  	params = {"asdf" => "qwer"}
  end
  def suscribe
  	gibbon = Gibbon::Request.new
    gibbon.lists("c37ad8771c").members(Digest::MD5.hexdigest(current_user.email)).update(body: { status: "subscribed" })
    redirect_to "/"
  end
  def unsuscribe
  	gibbon = Gibbon::Request.new
    gibbon.lists("c37ad8771c").members(Digest::MD5.hexdigest(current_user.email)).update(body: { status: "unsubscribed" })
    redirect_to "/"
  end
  def actualizarIntereses
 	gibbon = Gibbon::Request.new
 	aux=gibbon.lists("c37ad8771c").members.retrieve(params: { "email": current_user.email})
  	usuario=aux["members"][0]
  	idusuario=usuario["id"]
  	@intereses=usuario["interests"]
  	@ids=params["ids"]
  	@userupdate={}
  	@intereses.each { |k, v| 
  		@userupdate[k]=false
  		for i in 0..@ids.count-1

	  		if (k==@ids[i])
	  			@userupdate[k]=true
	  		end
	  	end
  	}
  	gibbon.lists("c37ad8771c").members(idusuario).update(body: {interests: @userupdate})

    end

end
Digest::MD5.hexdigest('foobar')