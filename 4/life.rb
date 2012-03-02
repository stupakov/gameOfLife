class Grid

    attr_accessor :cells, :rows, :cols

    def initialize(rows, cols, cells=nil)
        if cells.nil?
            @rows = rows
            @cols = cols
            @cells = Array.new(rows)
            0.upto(rows-1).each do |r|
                @cells[r] = Array.new(cols)
            end
        else
            @cells = cells
            @rows = @cells.size
            @cols = @cells[0].size
        end
    end

    def display
        @cells.each do |row|
            row.each do |cell|
                print (cell == 0) ? "." : "o"
            end
            print "\n"
        end
    end

    def print_neighbor_counts
        0.upto(@rows-1) do |r|
            0.upto(@cols-1) do |c|
                print (@cells[r][c] == 0) ? "." : count_neighbors(r,c)
            end
            print "\n"
        end
    end

    def count_neighbors(r,c)
        count = 0
        row_range(r).each do |rindex|
            col_range(c).each do |cindex|
                if (@cells[rindex][cindex] == 1)
                    count += 1 unless (r == rindex && c == cindex) 
                end
            end
        end
        count
    end

    def next_state
        next_grid = Grid.new(@rows, @cols)
        0.upto(@rows-1) do |r|
            0.upto(@cols-1) do |c|
                num_neighbors = count_neighbors(r,c)
                if (1 == @cells[r][c]) #live cell
                    if ([2,3].include?(num_neighbors))
                        next_grid.cells[r][c] = 1
                    else
                        next_grid.cells[r][c] = 0
                    end
                else #dead cell
                    if (3 == num_neighbors)
                        next_grid.cells[r][c] = 1
                    else
                        next_grid.cells[r][c] = 0
                    end
                end
            end
        end
        next_grid
    end

    def row_range(r)
        low = (r == 0) ? 0 : (r - 1)
        high = (r == @rows-1) ? (@rows -1) : (r + 1)
        low..high
    end

    def col_range(r)
        low = (r == 0) ? 0 : (r - 1)
        high = (r == @cols-1) ? (@cols -1) : (r + 1)
        low..high
    end
end




g = Grid.new(3, 3,
        [
             [ 0, 0, 0, 0, 0, 0, 0 ],
             [ 0, 0, 0, 1, 1, 0, 0 ],
             [ 0, 0, 0, 1, 1, 0, 0 ],
             [ 0, 1, 1, 0, 0, 0, 0 ],
             [ 0, 1, 1, 0, 0, 0, 0 ],
             [ 0, 0, 0, 0, 0, 0, 0 ],
             [ 0, 0, 0, 0, 0, 0, 0 ],
             [ 0, 0, 0, 0, 0, 0, 0 ],
             [ 0, 0, 0, 0, 0, 0, 0 ],
             [ 0, 0, 0, 0, 0, 0, 0 ],
             [ 0, 0, 0, 0, 0, 0, 0 ]
             #[ 0, 1, 0, 1, 0, 0, 0 ],
             #[ 0, 0, 0, 0, 1, 0, 0 ],
             #[ 0, 1, 0, 0, 1, 0, 0 ],
             #[ 0, 0, 1, 1, 1, 0, 0 ],
             #[ 0, 0, 0, 0, 0, 0, 0 ],
             #[ 0, 0, 0, 0, 0, 0, 0 ],
             #[ 0, 0, 0, 0, 0, 0, 0 ],
             #[ 0, 0, 0, 0, 0, 0, 0 ],
             #[ 0, 0, 0, 0, 0, 0, 0 ],
             #[ 0, 0, 0, 0, 0, 0, 0 ],
             #[ 0, 0, 0, 0, 0, 0, 0 ]
        ]
            )

            g = Grid.new(10,10, 

#g.display
#puts"====================================================================="
#g.print_neighbor_counts


40.times do 
    g = g.next_state
    g.print_neighbor_counts
    sleep 1
    print "\e[2J\e[f"
end
