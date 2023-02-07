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