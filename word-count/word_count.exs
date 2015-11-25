defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    words = sanitize(sentence)

    Enum.reduce words, %{}, fn word, acc ->
      update_count(acc, word)
    end
  end

  defp sanitize(sentence) do
    sentence
    |> String.replace(~r/[^\w-]|_/u, " ")
    |> String.downcase
    |> String.split
  end

  defp update_count(occurrences, word) do
    Map.update(occurrences, word, 1, &(&1 + 1))
  end
end
