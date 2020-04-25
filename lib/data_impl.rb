# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require_relative "data_impl/version"

# DataType.
# @class_description
#   A Data class implementation. Implements the Data interface.
class DataType < DataInt

  # self.types().
  # @description
  #   Gets the DataTypes.
  # @return [Array]
  #   The Data type identifiers, contained.
  def self.types()
    return TYPES
  end

  # self.instance?(obj = nil).
  # @description
  #   Predicate. Verifies an object is a DataType type instance.
  # @param obj [.]
  #   Any object.
  # @return [TrueClass, FalseClass]
  #   True in the case the argument is a Numeric, FalseClass, Symbol, TrueClass,
  #   or NilClass instance. False otherwise.
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
  # @description
  #   Predicate. Verifies an identifier is a DataType.
  # @param type [.]
  #   Any identifier.
  # @return [TrueClass, FalseClass]
  #   True in the case the type is Numeric, FalseClass, Symbol, TrueClass, or
  #   NilClass, or, one of their ancestors. False otherwise.
  def self.type?(type = nil)

    types_element = self.types_element?(type)
    type_child    = self.type_child?(type)
    return (types_element || type_child)

  end

  # self.types_element?(type = nil).
  # @description
  #   Predicate. Verifies an identifier exists in the TYPES array.
  # @param type [.]
  #   Any identifier.
  # @return [TrueClass, FalseClass]
  #   True in the case the argument exists in the TYPES array. False otherwise.
  def self.types_element?(type = nil)
    boolean = TYPES.include?(type)
    return boolean
  end

  # self.type_child?(type = nil).
  # @description
  #   Predicate. Verifies an identifier is a TYPES element child.
  # @param type [.]
  #   Any identifier.
  # @return [TrueClass, FalseClass]
  #   True in the case the identifier is a TYPES element child. False otherwise.
  def self.type_child?(type = nil)

    boolean        = false
    ancestor_array = type.ancestors()
    if (type.class().equal?(Class))
      ancestor_array.each { |ancestor|
        if (TYPES.include?(ancestor))
          boolean = true
        end
      }
    end
    return boolean

  end

  # Private constants.
  TYPES = [Numeric, FalseClass, Symbol, TrueClass, NilClass].freeze()

  private_constant :TYPES

end
