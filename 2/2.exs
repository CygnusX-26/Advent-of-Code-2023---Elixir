defmodule AOC.Day2 do

  def part1 do
    File.read!("2/input.txt") |> String.split("\n", trim: true) |> Enum.map(fn(x) -> String.split(x, ":", trim: true) end)
    |> Enum.reduce(0, fn ([game, values], acc) ->
      cond do
        is_valid(values) -> (String.split(game, " ", trim: true) |> Enum.at(1) |> Integer.parse |> elem(0)) + acc
        true -> acc
      end
    end)
    |> IO.inspect
  end

  def part2 do
    File.read!("2/input.txt") |> String.split("\n", trim: true) |> Enum.map(fn(x) -> String.split(x, ":", trim: true) end)
    |> Enum.reduce(0, fn ([_, values], acc) -> acc + counter(values) end) |> IO.inspect
  end

  defp counter(values) do
    values |> String.trim
    |> String.split(";", trim: true)
    |> Enum.map(fn(x) -> String.split(x, ",", trim: true) |> Enum.map(fn(x) -> String.trim(x) end)
      |> Enum.reduce([0, 0, 0], fn(x, acc) -> String.split(x, " ") |>
      then(fn([n | color]) ->
        cond do
          color == ["red"] -> [Enum.at(acc, 0) + (Integer.parse(n) |> elem(0)), Enum.at(acc, 1), Enum.at(acc, 2)]
          color == ["blue"] -> [Enum.at(acc, 0), Enum.at(acc, 1) + (Integer.parse(n) |> elem(0)), Enum.at(acc, 2)]
          color == ["green"] -> [Enum.at(acc, 0), Enum.at(acc, 1), Enum.at(acc, 2) + (Integer.parse(n) |> elem(0))]
          true -> acc
        end end)
      end)
    end)
    |> Enum.reduce([0,0,0], fn(arr, acc) ->
      [
        (if Enum.at(arr, 0) > Enum.at(acc, 0), do: Enum.at(arr, 0), else: Enum.at(acc, 0)),
        (if Enum.at(arr, 1) > Enum.at(acc, 1), do: Enum.at(arr, 1), else: Enum.at(acc, 1)),
        (if Enum.at(arr, 2) > Enum.at(acc, 2), do: Enum.at(arr, 2), else: Enum.at(acc, 2))
      ]
    end)
    |> Enum.reduce(1, fn(x, acc) -> acc * x end)
  end

  defp is_valid(values) do
    values |> String.trim
    |> String.split(";", trim: true)
    |> Enum.map(fn(x) -> String.split(x, ",", trim: true) |> Enum.map(fn(x) -> String.trim(x) end)
      |> Enum.reduce([0, 0, 0], fn(x, acc) -> String.split(x, " ") |>
      then(fn([n | color]) ->
        cond do
          color == ["red"] -> [Enum.at(acc, 0) + (Integer.parse(n) |> elem(0)), Enum.at(acc, 1), Enum.at(acc, 2)]
          color == ["blue"] -> [Enum.at(acc, 0), Enum.at(acc, 1) + (Integer.parse(n) |> elem(0)), Enum.at(acc, 2)]
          color == ["green"] -> [Enum.at(acc, 0), Enum.at(acc, 1), Enum.at(acc, 2) + (Integer.parse(n) |> elem(0))]
          true -> acc
        end end) end) end)
    |> Enum.reduce(true, fn([red, blue, green], acc) -> red < 13 && green < 14 && blue < 15 && acc end)
  end
end

AOC.Day2.part1
AOC.Day2.part2
