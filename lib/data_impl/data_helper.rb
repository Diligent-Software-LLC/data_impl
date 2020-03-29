require_relative '../data_impl'

# DataHelper.
# @abstract
#   Contains the DataType class's helper methods.
module DataHelper

  extend_object(DataType)
  TYPES = [Numeric, FalseClass, Symbol, TrueClass, String, Time,
           NilClass].freeze()

  # self.types_element?(type = nil).
  # @abstract
  #   Boolean method. Verifies a class constant exists in the TYPES array.
  # @param [*] type
  #   Any identifier.
  # @return [TrueClass, FalseClass] boolean
  #   True in the case the argument exists in the TYPES array. False otherwise.
  def types_element?(type = nil)
    boolean = TYPES.include?(type)
    return boolean
  end

  # self.type_child?(type = nil).
  # @abstract
  #   Boolean method. Verifies a type is a TYPES element child.
  # @param [*] type
  #   Any type identifier.
  # @return [TrueClass, FalseClass] boolean
  #   True in the case the type is a TYPES element child. False otherwise.
  def type_child?(type = nil)

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

end