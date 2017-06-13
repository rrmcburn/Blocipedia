class MyMailer < ApplicationMailer

  default from: "rrmcburn@gmail.com"

   def new_registration(user)
     @user = user
     mail(to: user.email, subject: "Thank You For Registering")
   end

end
