# -- From https://www.assertnotmagic.com/2019/05/17/julia-read-grid/
lines = map(collect, readlines("input.txt"))
grid = permutedims(hcat(lines...))
# --
dims = size(grid)

cnt = 0

for n in axes(grid, 1), m in axes(grid, 2)
    if grid[n,m] == 'X'
        if n > 3 && grid[n-1,m] == 'M' && grid[n-2,m] == 'A' && grid[n-3,m] == 'S'
            global cnt += 1
        end
        if m > 3 && grid[n,m-1] == 'M' && grid[n,m-2] == 'A' && grid[n,m-3] == 'S'
            global cnt += 1
        end
        if n <= dims[1]-3 && grid[n+1,m] == 'M' && grid[n+2,m] == 'A' && grid[n+3,m] == 'S'
            global cnt += 1
        end
        if m <= dims[2]-3 && grid[n,m+1] == 'M' && grid[n,m+2] == 'A' && grid[n,m+3] == 'S'
            global cnt += 1
        end
        if n > 3 && m > 3 && grid[n-1,m-1] == 'M' && grid[n-2,m-2] == 'A' && grid[n-3,m-3] == 'S'
            global cnt += 1
        end
        if n > 3 && m <= dims[2]-3 && grid[n-1,m+1] == 'M' && grid[n-2,m+2] == 'A' && grid[n-3,m+3] == 'S'
            global cnt += 1
        end
        if n <= dims[2]-3 && m > 3 && grid[n+1,m-1] == 'M' && grid[n+2,m-2] == 'A' && grid[n+3,m-3] == 'S'
            global cnt += 1
        end
        if n <= dims[2]-3 && m <= dims[1]-3 && grid[n+1,m+1] == 'M' && grid[n+2,m+2] == 'A' && grid[n+3,m+3] == 'S'
            global cnt += 1
        end
    end
end

println(cnt)
