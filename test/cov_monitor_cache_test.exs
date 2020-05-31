defmodule CovMonitor.Cache.Test do
  use ExUnit.Case, async: true

  setup do
    cache = start_supervised!(CovMonitor.Cache)
    %{cache_pid: cache}
  end

  describe "init/1" do
    @tag :done
    test "init cache", %{cache_pid: pid} do
      # IO.inspect(cache, label: "PID")
      assert is_pid(pid)
    end

    @tag :done
    test "add country into cache" do
      assert CovMonitor.Cache.put("brazil", %{}) == :ok
    end

    @tag :done
    test "return value from cache" do
      CovMonitor.Cache.put("brazil", "value of cache")
      assert CovMonitor.Cache.get("brazil") == "value of cache"
    end
  end
end
