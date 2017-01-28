ActiveAdmin.register User do

  permit_params :login, :password, :first_name, :last_name, :patronymic, :avatar

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

      f.input :first_name
      f.input :last_name
      f.input :patronymic
      f.input :avatar
    end
    f.actions
  end

end
