class EmailapiController < ApplicationController
  def index
  	@email=current_user.email
  	gibbon = Gibbon::Request.new
  	categories=gibbon.lists("c37ad8771c").interest_categories.retrieve
  	@interests=gibbon.lists("c37ad8771c").interest_categories(categories["categories"][0]["id"]).interests.retrieve
  	@sizeInterests=@interests["interests"].count
  	@interestList=Array.new(@sizeInterests)
  end
  def suscribe
  	gibbon = Gibbon::Request.new
  	gibbon.lists("c37ad8771c").members(Digest::MD5.hexdigest(current_user.email)).upsert(body: {email_address: current_user.email, status: "subscribed", merge_fields: {FNAME: current_user.nombre, LNAME: current_user.apellido}})
    redirect_to "/emailapi"
  end
  def unsuscribe
  	gibbon = Gibbon::Request.new
    gibbon.lists("c37ad8771c").members(Digest::MD5.hexdigest(current_user.email)).update(body: { status: "unsubscribed" })
    redirect_to "/"
  end
  def actualizarIntereses
 	gibbon = Gibbon::Request.new
 	gibbon.lists("c37ad8771c").members(Digest::MD5.hexdigest(current_user.email)).upsert(body: {email_address: current_user.email, status: "subscribed", merge_fields: {FNAME: current_user.nombre, LNAME: current_user.apellido}})
 	aux=gibbon.lists("c37ad8771c").members.retrieve(params: { "email": current_user.email})
  	usuario=aux["members"][0]
  	idusuario=usuario["id"]
  	@intereses=usuario["interests"]
  	@ids=params["ids"]
  	@userupdate={}
  	@intereses.each { |k, v| 
  		@userupdate[k]=false
  		if (@lds!=nil)
    		for i in 1..@ids.count-1
  
  	  		if (k==@ids[i])
  	  			@userupdate[k]=true
  	  		end
  	  	end
  	  end
  	}
  	gibbon.lists("c37ad8771c").members(idusuario).update(body: {interests: @userupdate})
    redirect_to "/"
    end
end