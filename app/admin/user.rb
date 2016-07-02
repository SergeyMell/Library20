ActiveAdmin.register User do

  permit_params :login, :password

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      super
    end
  end

  form do |f|
    f.inputs 'User Info' do
      f.input :login
      f.input :password
    end
    f.actions
  end

end
