class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def jwt_payload
    {
      'sub' => id,
      'email' => email,
      'exp' => 1.day.from_now.to_i
    }
  end
end
