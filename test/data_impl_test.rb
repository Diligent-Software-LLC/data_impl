require_relative 'test_helper'

# DataTypeTest.
# @abstract
#   Tests the DataType class.
class DataTypeTest < Minitest::Test

  CLASS = DataType.freeze()

  # test_conf_doc_f_ex().
  # @abstract
  #   The .travis.yml, CODE_OF_CONDUCT.md, Gemfile, LICENSE.txt, and 
  #   README.md files exist.
  def test_conf_doc_f_ex()

    assert_path_exists('.travis.yml')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('Gemfile')
    assert_path_exists('LICENSE.txt')
    assert_path_exists('README.md')

  end

  # test_version_declared().
  # @abstract
  #   The version was declared.
  def test_version_declared()
    refute_nil(CLASS::VERSION)
  end

  # setup().
  # @abstract
  #   Set fixtures.
  def setup()

  @x1_data   = 0
    @x2_data   = {}
    @x1_data_1 = Float
    @x2_data_1 = Hash
    @x1_data_0 = String
    @x2_data_0 = Hash
    @x1_data_2 = Integer

  end

  # self.instance?(obj = nil)

  # test_inst_b_x1().
  # @abstract
  #   A data instance.
  def test_inst_b_x1()
    assert(CLASS.instance?(@x1_data))
  end

  # test_inst_b_x2().
  # @abstract
  #   An invalid data instance.
  def test_inst_b_x2()
    refute(CLASS.instance?(@x2_data))
  end

  # self.type?(type = nil)

  # test_type_b_x1().
  # @abstract
  #   A valid class.
  def test_type_b_x1()
    assert(CLASS.type?(@x1_data_1))
  end

  # test_type_b_x2().
  # @abstract
  #   An invalid class.
  def test_type_b_x2()
    refute(CLASS.type?(@x2_data_1))
  end

  # Comment the private_constant statement.

  # self.types_element?(type = nil)

  # test_te_x1().
  # @abstract
  #   A TYPES element.
  def test_te_x1()
    # assert_includes(CLASS::TYPES, @x1_data_0)
  end

  # test_te_x2().
  # @abstract
  #   An invalid type.
  def test_te_x2()
    # refute_includes(CLASS::TYPES, @x2_data_0)
  end

  # self.type_child?(type = nil)

  # test_tc_x1().
  # @abstract
  #   A type child.
  def test_tc_x1()
    # assert(CLASS.type_child?(@x1_data_2))
  end

  # test_tc_x2().
  # @abstract
  #   An invalid type.
  def test_tc_x2()
    # refute(CLASS.type_child?(@x2_data_1))
  end

  # teardown().
  # @abstract
  #   Cleanup.
  def teardown()
  end

end
