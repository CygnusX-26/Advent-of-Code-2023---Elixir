defmodule AOC.Day1 do
  def part1 do
    File.read!("input.txt") |> String.split("\n", trim: true) |> Enum.map(fn(x) ->
      String.replace(x, ~r"[^0-9]", "") |> then(&(
          String.at(&1, 0) <> String.at(&1, String.length(&1)-1) |> Integer.parse |> elem(0)
      ))
    end ) |>  Enum.sum |> IO.inspect
  end

  @replacements %{
    "zero" => "0",
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }

  def part2 do
    File.read!("input.txt") |> String.split("\n", trim: true) |> Enum.map(&word_to_num/1) |> Enum.map(fn(x) ->
      String.at(x, 0) <> String.at(x, String.length(x)-1) |> Integer.parse |> elem(0) end) |>  Enum.sum |> IO.inspect
  end

  defp word_to_num (word) do
    Enum.reduce(@replacements, word, fn {k, v}, acc -> String.replace(acc, k, String.at(k, 0) <> v <> String.at(k, String.length(k)-1)) end)
    |> String.replace(~r"[^0-9]", "")
  end
end
AOC.Day1.part1
AOC.Day1.part2
