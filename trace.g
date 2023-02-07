# trace from grouptheory, chapter 2, alg 2
# inputs:
# G     , a permutation group
# V     , a schreier vector for
# alpha , an element of Omega, which is the root of the schreier vector
# delta , an element of Omega, which is the goal
# phi   , the group action
# Omega , a G-set

# returns:
# false     , if delta is not in the orbit of alpha wrt G
# g         , an element of Omega, s.t. delta^g = alpha

TTrace := function(G, V, alpha, delta, phi, Omega)
    local gamma, g;
    if V[Position(Omega, delta)] = 0 then
        return false;
    fi;
    g := One(G);
    gamma := delta;
    while not gamma = alpha do
        g:=g*V[Position(Omega, gamma)];
        gamma:=phi(gamma, V[Position(Omega, gamma)]);
    od;
    return g;
end;