defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    words = sentence |> String.replace(~r{[_\W]}, " ") |> String.split

    Enum.reduce words, %{}, fn word, acc ->
      update_count(acc, word)
    end
  end

  defp update_count(occurrences, word) do
    word = String.downcase word
    count = occurrences[word]

    if is_nil(count) do
      Map.put(occurrences, word, 1)
    else
      Map.put(occurrences, word, count + 1)
    end
  end
end
