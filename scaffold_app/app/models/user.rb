class User < ApplicationRecord
  def test
    'test desu.'
  end
  def full_name
    name + address
  end
end
