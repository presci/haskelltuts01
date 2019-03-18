graph=[[92,	118,	116,	155],
    	[62,	13,	177,	145],
    	[44,	80,	185,	59],
    	[16,	137,	32,	155],
    	[152,	75,	41,	99]]

def bfs(graph, search):
    if graph is None:
        return
    r,c = 0,0
    queue = [(graph[r][c], r, c, [graph[r][c]])]
    while True:
        if not queue:
            return
        vertex, r, c, path = queue.pop(0)
        if search == vertex:
            yield path
        print vertex
        print path
        _r = r + 1
        _c = c + 1
        if _r < len(graph):
            queue.append((graph[_r][c], _r, c, path + [graph[_r][c]]))
        if _c < len(graph[0]):
            queue.append((graph[r][_c], r, _c, path + [graph[r][_c]]))



print list(bfs(graph, 137))
