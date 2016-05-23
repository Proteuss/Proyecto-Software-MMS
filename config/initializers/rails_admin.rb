RailsAdmin.config do |config|
  config.included_models = ["Noticia", "User"]
  config.main_app_name = ["Administracion general"]

  config.model Noticia do
    edit do
      
      field :titulo
      field :portada
      field :descripcion
      field :contenido, :ck_editor
      
      
    end
  end
 config.model User do
    edit do
      field :rol
    end
  end

config.authorize_with do |controller|
    unless (!current_user.nil? && (current_user.rol==1 || current_user.rol==2))
      flash[:error] = "No tienes privilegios de administrador."
      redirect_to "/"
    end
  end
  ### Popular gems integration

  ## == Devise ==
  #config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new  do
      except ['User']
    end
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
