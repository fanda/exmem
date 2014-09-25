class <%= plural_class_name %>Controller < ApplicationController

  before_filter :authenticate_user!

  <%= controller_methods :actions %>
end
