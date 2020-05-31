defmodule CovMonitorTest do
  use ExUnit.Case, async: true

  import Mox
  import ExUnit.CaptureLog

  require Logger

  alias CovMonitor.Logic
  alias Test.Fixtures.Api, as: Fix

  doctest(CovMonitor)

  setup :verify_on_exit!

  describe "cases_by/0" do
    @tag :done
    test "returns list of cases" do
      CovMonitor.Http.Mock
      |> expect(:cases_by, fn _country ->
        {:ok, [Fix.data_intern()]}
      end)

      assert CovMonitor.data_covid() == [Fix.data_intern()] |> Logic.deltas()
    end

    @tag :done
    test "returns erro from request" do
      CovMonitor.Http.Mock
      |> expect(:cases_by, fn _country -> {:error, "Bad request"} end)

      assert capture_log(fn -> CovMonitor.data_covid() end) =~ "Bad request"
    end
  end
end
