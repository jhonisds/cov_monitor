defmodule CovMonitorAdapterTest do
  use ExUnit.Case

  alias CovMonitor.Adapter, as: Adapter
  alias Test.Fixtures.Api, as: Fix

  describe "modify/1" do
    @tag :done
    test "returns modified data from api" do
      assert Adapter.modify(Fix.data_api(%{"Active" => 10})) == Fix.data_intern(%{active: 10})
    end
  end

  @tag :done
  describe "convert/1" do
    test "returns modified list" do
      assert Adapter.convert([Fix.data_api()]) == [Fix.data_intern()]
    end

    test "returns modified list for more one data" do
      assert Adapter.convert(Fix.entry_list()) == Fix.output_list()
    end
  end
end
