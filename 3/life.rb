require "set"
require "wrong"
include Wrong


class Board
    attr_accessor :cells
    
    def initialize
        @cells = Set.new
    end

    def set(coords)
        @cells << coords
    end

    def == (other)
        other.cells == @cells
    end

    def evolve
        board = Board.new
        potential_cells = Set.new
        @cells.each do |cell|

            potential_cells += cell
            potential_cells += neighbors(cell)

        end
        p potential_cells
        potential_cells.each do |cell|
            if alive? cell 
                board.set cell
             end
        end
        board
    
    end

    def neighbors cell
        y,x = cell
        [
            [x-1 , y-1],
            [x-1 , y],
            [x-1 , y+1],
            [x , y-1],
            [x , y+1],
            [x+1 , y-1],
            [x+1 , y],
            [x+1 , y+1]
        ]
    end

    def alive? cell
        neighbors
        true
    end

    def live_neighbors cell
        (@cells & neighbors(cell))
    end

    def will_live? cell
        
    end

    def num_neighbors cell
        live_neighbors.size  
    end

end

assert { Board.new == Board.new }
assert { Board.new.evolve == Board.new }

b = Board.new
b.set([1,1])
assert { b.evolve == Board.new }

horizontal = Board.new
horizontal.set([0,1])
horizontal.set([1,1])
horizontal.set([2,1])
deny { horizontal == Board.new }

assert { horizontal.num_neighbors([0,0]) == 2 }
assert { horizontal.num_neighbors([0,1]) == 3 }
assert { horizontal.num_neighbors([0,2]) == 2 }


vertical = Board.new
vertical.set([1,0])
vertical.set([1,1])
vertical.set([1,2])
assert { vertical.evolve == horizontal }

