class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json
  
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Connecté avec succès.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        token: request.env['warden-jwt_auth.token']
      }
    else
      render json: {
        status: { code: 401, message: "Email ou mot de passe incorrect." }
      }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "Déconnecté avec succès."
      }
    else
      render json: {
        status: 401,
        message: "Hmm, quelque chose s'est mal passé."
      }
    end
  end
end
