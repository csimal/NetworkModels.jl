
"""
    Return the graph whose vertices are the edges of `g`, which are linked by an edge if they share a vertex.
"""
function line_graph(g::AbstractSimpleGraph)
    E = incidence_matrix(g)
    A = E'*E - 2I
    return SimpleGraph(A)
end