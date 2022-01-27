
function random_spatial_network(n::Integer; # number of nodes
    d::Integer = 2, # dimension
    Pk = Poisson(10), # Expected degree distribution
    Pf = Normal(0.0, 0.03) # Distance kernel
    )
    ks = rand(Pk, n)
    xs = rand(n,d)
    dists = Array{Float64,2}(undef, n, n)
    for i in 1:n, j in i:n
        dists[i,j] = norm(xs[i,:]-xs[j,:])
        dists[j,i] = dists[i,j]
    end
    f = x -> pdf(Pf, x)
    return random_spatial_network(dists, ks, f, 1), xs
end

function random_spatial_network(distances::AbstractMatrix, ks, f, ρ)
    k = mean(ks)
    ps = (ks * ks') .* f.(distances) / (ρ * k)
    return edge_probability_graph(ps)
end

function edge_probability_graph(ps::AbstractMatrix)
    n = size(ps, 1)
    edges = [(i,j) for i in 1:n-1, j in (i+1):n if rand() < ps[i,j]]
    return SimpleGraphFromIterator(edges)
end

function geometric_inhomogeneous_random_graph(n, τ, α)
    
end