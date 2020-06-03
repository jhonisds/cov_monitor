defmodule CovMonitor.Cache.Test do
  use ExUnit.Case, async: true

  alias CovMonitor.Cache

  describe "init/1" do
    @tag :done
    test "add country into cache" do
      assert Cache.put("brazil", %{}) == :ok
    end

    @tag :done
    test "return value from cache" do
      Cache.put("brazil", "value of cache")
      assert Cache.get("brazil") == {:ok, "value of cache"}
    end

    @tag :done
    test "returns {:ok, nil} when cache is empty" do
      Cache.put("key", "value of cache")
      assert Cache.get("invalid_key") == {:ok, nil}
    end
  end
end
