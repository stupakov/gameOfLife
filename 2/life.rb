require "rspec"

class Grid
    attr_accessor :cells, :rows, :cols

    def initialize(*args)
        if args[0].is_a?(Array)
            @cells = args[0]
            @rows = @cells.length
            @cols = @cells[0].length
        else
            @rows = args[0]
            @cols = args[1]
            @cells = Array.new(@rows)
            0.upto(@rows-1) do |rowindex|
                @cells[rowindex] = Array.new(@cols)
                0.upto(@cols-1) do |colindex|
                    @cells[rowindex][colindex] = 0
                end
            end
        end
    end


    def get_rows_range(index)
        low = (index == 0) ? 0 : (index - 1)
        high = (index == @rows - 1) ? (@rows - 1) : (index + 1)
        low..high
    end

    def get_cols_range(index)
        low = (index == 0) ? 0 : (index - 1)
        high = (index == @cols - 1) ? (@cols - 1) : (index + 1)
        low..high
    end

    def count_neighbors(x, y)
        result = 0
        get_rows_range(x).each do |r|
            get_cols_range(y).each do |c|
                result+= @cells[r][c] unless (r==x && c==y)
            end
        end
        return result
    end



end



describe "grid" do
    it "should initialize to empty" do
        g = Grid.new(4,5)
        g.cells.should ==  [
            [ 0, 0, 0, 0, 0 ],
            [ 0, 0, 0, 0, 0 ],
            [ 0, 0, 0, 0, 0 ],
            [ 0, 0, 0, 0, 0 ]
        ]
    end

    it "should have correct width and height" do
        g = Grid.new(3,4)
        g.rows.should == 3
        g.cols.should == 4
    end

    it "should allow initializing hardcoded values" do
        values = [
            [ 0, 0, 0, 0, 0 ],
            [ 1, 1, 1, 0, 0 ],
            [ 0, 0, 0, 0, 0 ],
            [ 0, 0, 0, 0, 0 ],
            [ 0, 0, 0, 0, 0 ]
        ]
        g = Grid.new(values)
        g.cells.should == values
    end

    describe "#count_neighbors" do
        it "should handle the zero cases" do
            g = Grid.new(3,3)
            0.upto(2) do |i|
                0.upto(2) { |j| g.count_neighbors(i,j).should == 0 }
            end
        end
        
        it "should handle the nonzero cases" do
            values = [
                [ 0, 0, 0 ],
                [ 1, 1, 1 ],
                [ 0, 0, 0 ]
            ]
            g = Grid.new(values)
            g.count_neighbors(0,0).should == 2
            g.count_neighbors(0,1).should == 3
            g.count_neighbors(0,2).should == 2
            g.count_neighbors(1,0).should == 1
            g.count_neighbors(1,1).should == 2
            g.count_neighbors(1,2).should == 1
            g.count_neighbors(2,0).should == 2
            g.count_neighbors(2,1).should == 3
            g.count_neighbors(2,2).should == 2
        end
    end

    describe "#next_generation" do
        it "should calculate the next generation" do
            values = [
                [ 0, 0, 0 ],
                [ 1, 1, 1 ],
                [ 0, 0, 0 ]
            ]

         end
    end

end

