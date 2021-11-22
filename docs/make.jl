using NetworkModels
using Documenter

DocMeta.setdocmeta!(NetworkModels, :DocTestSetup, :(using NetworkModels); recursive=true)

makedocs(;
    modules=[NetworkModels],
    authors="Cédric Simal, University of Namur",
    repo="https://github.com/csimal/NetworkModels.jl/blob/{commit}{path}#{line}",
    sitename="NetworkModels.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://csimal.github.io/NetworkModels.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/csimal/NetworkModels.jl",
    devbranch="main",
)
