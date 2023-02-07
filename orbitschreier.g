orbitschreier := function(G, alpha)
    local V, orb, j, g;
    orb:=[alpha];
    j:=1;
    for g in Elements(G) do
        Append(V, 0);
    od;
    Add(V, One(G), Position(Elements(G), alpha));
    return V;
end;