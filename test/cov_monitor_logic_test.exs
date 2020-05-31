defmodule CovMonitor.Logic.Test do
  use ExUnit.Case, async: true

  alias CovMonitor.Logic
  alias Test.Fixtures.Api, as: Fix

  doctest(CovMonitor)

  describe "deltas/1" do
    @tag :done
    test "returns delta for last seven days" do
      input = [
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(%{
          active: 2,
          confirmed: 2,
          deaths: 2,
          recovered: 2,
          date: "06/05/2020"
        })
      ]

      # IO.inspect(input, label: "[DEBUG]")

      assert Logic.deltas(input) == Fix.deltas()
    end

    @tag :done
    test "returns delta for only seven days" do
      input = [
        Fix.data_intern(%{
          active: 2,
          confirmed: 2,
          deaths: 2,
          recovered: 2,
          date: "06/05/2020"
        }),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(%{
          active: 2,
          confirmed: 2,
          deaths: 2,
          recovered: 2,
          date: "06/05/2020"
        })
      ]

      assert Logic.deltas(input) == Fix.deltas()
    end

    @tag :done
    test "returns default value for less than seven days" do
      input = [
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(%{
          active: 2,
          confirmed: 2,
          deaths: 2,
          recovered: 2,
          date: "06/05/2020"
        })
      ]

      assert Logic.deltas(input) == Fix.deltas()
    end

    @tag :done
    test "returns int value for percentage" do
      input = [
        Fix.data_intern(%{confirmed: 123}),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(),
        Fix.data_intern(%{confirmed: 177})
      ]

      assert Logic.deltas(input)
             |> Map.get(:deltas)
             |> Map.get(:confirmed)
             |> Map.get(:percentage) == 43
    end
  end

  describe "deltas/0" do
    @tag :done
    test "when input is empty" do
      input = []
      assert Logic.deltas(input) == %{}
    end
  end
end
