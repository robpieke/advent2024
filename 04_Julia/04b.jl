# -- From https://www.assertnotmagic.com/2019/05/17/julia-read-grid/
lines = map(collect, readlines("input.txt"))
grid = permutedims(hcat(lines...))
# --
dims = size(grid)

cnt = 0

for n in axes(grid, 1), m in axes(grid, 2)
    if n>1 && m>1 && n<dims[2] && m<dims[1] && grid[n,m] == 'A'
        if ((grid[n-1,m-1] == 'M' && grid[n+1,m+1] == 'S') ||
            (grid[n-1,m-1] == 'S' && grid[n+1,m+1] == 'M')) &&
           ((grid[n-1,m+1] == 'M' && grid[n+1,m-1] == 'S') ||
            (grid[n-1,m+1] == 'S' && grid[n+1,m-1] == 'M'))
            global cnt += 1
        end
    end
end

println(cnt)
