class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:username]

        validates :username, presence: true,format: { with: /[a-z0-9_-]{4,15}/,
    message: "must contain 4 characters" }       
        validates :username, uniqueness: true
        validates :firstname, presence: true , format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows alphabets" }       
        validates :lastname, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
        validates :dob, presence: true
       validates :phone, presence: true, length:{ is: 10 , message: "phone number must be 10 digits"}
       #validates :phone, length:{ is: 10 , message: "phone number must be 10 digits"}
        #validates :phone,:presence => true,
         #        :numericality => true,
        #         :length => { :minimum => 10, :maximum => 15 }
   
end