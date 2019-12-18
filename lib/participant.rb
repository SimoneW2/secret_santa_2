require_relative '../data_mapper_setup'
#require 'data_mapper'

class Participant # IMPORTANT TO USE SINGLAR NOT PLURAL. datamapper will add the plural verson later.
  include DataMapper::Resource # This is the data mapper module

  property :id, Serial # An auto-increment integer key
  property :name, String
  property :phone, Integer
  property :email, String
  property :receiver, String
  property :user_id, Integer

end
