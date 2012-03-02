class Grid
    attr_accessor :cells
    attr_accessor :rows, :cols

    # create empty grid
    def initialize(rows, cols)
        @cells = Array.new(rows)
        @rows = rows
        @cols = cols

        0.upto(rows) do |r|
            @cells[r] = Array.new(cols)
            0.upto(cols) do |c|
                @cells[r][c] = 0
            end
        end
    end

    def hardcode
        @cells = [
            [ 0, 0, 0, 0, 0, 0 ],
            [ 0, 0, 1, 1, 1, 0 ],
            [ 0, 0, 0, 0, 0, 0 ],
            [ 0, 0, 0, 1, 0, 0 ],
            [ 0, 0, 0, 1, 0, 0 ],
            [ 0, 0, 0, 1, 0, 0 ]
        ]
    end

    def randomize
        

    end

    def update(r,c,state)
        @cells[r][c] = state
    end


    def count_neighbors(r,c)
        range(r, @rows).each do |r|
            range(c, @cols).each do |c|
                @cells[r][c]
            end
        end
    end

    # XXX needs test
    def range(value, limit)
        low = (value == 0) ? 0 : (value - 1)
        high = (value == limit - 1) ? (limit - 1) : (value + 1)
        low..high
    end

end


