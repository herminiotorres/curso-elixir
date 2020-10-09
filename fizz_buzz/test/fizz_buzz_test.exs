defmodule FizzBuzzTest do
  use ExUnit.Case, async: true

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response =
        {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz, 11, :fizz, 13, 14, :fizzbuzz]}

      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test " when an invalid file is provided, returns and error" do
      expected_response = {:error, "Error reading the file: enoent"}

      assert FizzBuzz.build("a") == expected_response
    end
  end
end
