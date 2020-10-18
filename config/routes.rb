Rails.application.routes.draw do

  namespace :admin do
    get 'members/genres'
    get 'members/items'
    get 'members/orders'
    get 'members/ordered_items'
    get 'members/homes'
  end
  devise_for :admins
  devise_for :members

  namespace :admin do
    resources :members,:genres, except:[:show, :new, :destroy]
    resources :items, except:[:destroy]
    resources :orders, except:[:destroy, :edit]
    resources :ordered_items, only:[:update]
    root 'homes#top'
  end

    resource :member, except:[:create, :new, :destroy]
    resources :delivery_destinations, except:[:show, :new]
    resources :items, except:[:destroy]
    resources :cart_items, except:[:show, :new, :edit]
    resources :orders, except:[:edit, :update, :destroy]
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/check' => 'orders#check'
    get 'members/leave' => 'members#leave'
    patch 'members/actived' => 'members#actived'
    put 'members/actived' => 'members#actived'
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
