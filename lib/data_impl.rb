# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require_relative "data_impl/version"
require_relative 'data_impl/data_helper'

# DataType.
# @abstract
#   A Data class implementation. Implements the Data interface.
class DataType < DataInt

  # self.instance?(obj = nil).
  # @abstract
  #   Boolean method. Verifies an object is a data type instance.
  # @param [*] obj
  #   Any object.
  # @return [TrueClass, FalseClass] boolean
  #   True in the case the argument is a Numeric, FalseClass, Symbol,
  #   TrueClass, String, Time, or NilClass object. False otherwise.
  def self.instance?(obj = nil)
    boolean = false
    TYPES.each { |type|
      if (obj.is_a?(type))
        boolean = true
      end
    }
    return boolean
  end

  # self.type?(type = nil).
  # @abstract
  #   Boolean method. Verifies a type is a data type.
  # @param [*] type
  #   A class name.
  # @return [TrueClass, FalseClass] boolean
  #   True in the case the type is Numeric, FalseClass, Symbol, TrueClass,
  #   String, Time, or NilClass, or, one of their ancestors. False otherwise.
  def self.type?(type = nil)
    types_element = self.types_element?(type)
    type_child    = self.type_child?(type)
    return (types_element || type_child)
  end

  TYPES = [Numeric, FalseClass, Symbol, TrueClass, String, Time,
           NilClass].freeze()

  private_constant :TYPES

end

