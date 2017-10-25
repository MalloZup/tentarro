defmodule Tentarro do
  @moduledoc """
  Documentation for tentarro.
  """

  @doc """
  Tentarro main module
  """

  def repo_exist(repo) do
    IO.puts repo
  end

  def no_opt do
    IO.puts 'NO OPTION'
  end
end

defmodule Tentarro.CLI do
  def main(args \\ []) do
    args
    |> parse_args
    |> response
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [repo: :boolean])

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:repo], do: Tentarro.repo_exist(word), else: Tentarro.no_opt
  end
end

