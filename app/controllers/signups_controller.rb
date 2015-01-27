class SignupsController < ApplicationController

def create  

    @signup = Signup.new()
    @signup.email = params[:signup][:email]

    if @signup.save
      
      redirect_to root_path, :notice => ( @signup.email + " was signed up!" )
      #redirect_to "/sites", :notice => imageArray

    else  
    
    redirect_to root_path
    
    end  


end

end
