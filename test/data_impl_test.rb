require_relative 'test_helper'

# DataTypeTest.
# @class_description
#   Tests the DataType class.
class DataTypeTest < Minitest::Test

  CLASS         = DataType
  INTEGER_INST  = 0
  HASH_INST     = {}
  CLASS_FLOAT   = Float
  CLASS_HASH    = Hash
  CLASS_STRING  = String
  CLASS_INTEGER = Integer
  CLASS_NUMERIC = Numeric

  # test_conf_doc_f_ex().
  # @description
  #   The .travis.yml, CODE_OF_CONDUCT.md, Gemfile, LICENSE.txt, README.md,
  #   and .yardopts files exist.
  def test_conf_doc_f_ex()

    assert_path_exists('.travis.yml')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('Gemfile')
    assert_path_exists('LICENSE.txt')
    assert_path_exists('README.md')
    assert_path_exists('.yardopts')

  end

  # test_version_declared().
  # @description
  #   The version was declared.
  def test_version_declared()
    refute_nil(CLASS::VERSION)
  end

  # setup().
  # @description
  #   Set fixtures.
  def setup()
  end

  # self.types()

  # test_ct_x().
  # @description
  #   TYPES.
  def test_ct_x()
    expected = [Numeric, FalseClass, Symbol, TrueClass, NilClass]
    assert_equal(expected, CLASS.types())
  end

  # self.instance?(obj = nil)

  # test_inst_b_x1().
  # @description
  #   A data instance.
  def test_inst_b_x1()
    assert(CLASS.instance?(INTEGER_INST))
  end

  # test_inst_b_x2().
  # @description
  #   An invalid data instance.
  def test_inst_b_x2()
    refute(CLASS.instance?(HASH_INST))
  end

  # self.type?(type = nil)

  # test_type_b_x1().
  # @description
  #   A valid class.
  def test_type_b_x1()
    assert(CLASS.type?(CLASS_FLOAT))
  end

  # test_type_b_x2().
  # @description
  #   An invalid class.
  def test_type_b_x2()
    refute(CLASS.type?(CLASS_HASH))
  end

  # self.types_element?(type = nil)

  # test_cte_x1().
  # @description
  #   A types element identifier.
  def test_cte_x1()
    assert_operator(CLASS, 'types_element?', CLASS_NUMERIC)
  end

  # test_cte_x2().
  # @description
  #   An invalid type identifier.
  def test_cte_x2()
    refute_operator(CLASS, 'types_element?', CLASS_HASH)
  end

  # self.type_child?(type = nil)

  # test_tc_x1().
  # @description
  #   A type child.
  def test_tc_x1()
    assert(CLASS.type_child?(CLASS_INTEGER))
  end

  # test_tc_x2().
  # @description
  #   An invalid type.
  def test_tc_x2()
    refute(CLASS.type_child?(CLASS_HASH))
  end

  # teardown().
  # @description
  #   Cleanup.
  def teardown()
  end

end
