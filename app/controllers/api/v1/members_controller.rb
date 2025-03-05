class Api::V1::MembersController < Api::V1::BaseController
  def show
    render json: {
      status: { code: 200, message: 'Succès.' },
      data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    }
  end
end
