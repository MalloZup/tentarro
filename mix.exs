defmodule Tentarro.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tentarro,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      escript: [main_module: Tentarro.CLI],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      applications: [:tentacat]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     {:tentacat, "~> 0.5"},
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end
