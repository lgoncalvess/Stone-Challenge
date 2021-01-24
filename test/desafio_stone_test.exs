defmodule DesafioStoneTest do
  use ExUnit.Case

  describe "build/2" do
    test "when both empty lists are provided, return a message informing the lists are empty." do
      assert DesafioStone.build([],[]) == "Both lists are empty!"
    end

    test "when the first empty list are provided, return a message informing what list are empty." do
      assert DesafioStone.build([],["just_a_test"]) == "Email list are empty!"
    end

    test "when the second empty list are provided, return a message informing what list are empty." do
      assert DesafioStone.build(["just_a_test"],[]) == "Shopping list are empty!"
    end

    test "when both lists are not empty, then a calculation is aply and returned a map. The calc is prices * quantities / total of peoples" do
      assert DesafioStone.build(["p1","p2"],[%{:item => "rice", :price => 10000, :quantity => 3}]) == %{"p1" => 15000, "p2" => 15000}
    end
  end
end
