class Admin < ActiveRecord::Base

	enum role: [:full_access,:restricted_access]	 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  scope :Full_Access, -> { where(role: 0)}
  scope :with_restricted_access, -> { where(role: 1) }

  def role_br
  	if self.role == 'full_access'
  		'Acesso Completo'
  	else
  		'Acesso Restrito'
  	end
  end       
end
