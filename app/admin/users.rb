ActiveAdmin.register User do
  index do
    column :first_name
    column :last_name
    column :email
    column :admin
    default_actions
  end

  form do |f|
    f.inputs "User" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :admin
    end
    f.buttons
  end
  
end
