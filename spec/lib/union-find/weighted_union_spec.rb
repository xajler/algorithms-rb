require './spec/spec_helper'
require './spec/helpers/union_helper'
require './lib/union-find/weighted_union'

describe WeightedUnion do
  let :weighted_union do
    WeightedUnion.new(9)
  end

  subject do
    weighted_union
  end

  context '#initialize' do
    it 'sets ids and sz instance variables as Array' do
      weighted_union.ids.should be_a_kind_of Array
      weighted_union.sz.should be_a_kind_of Array
    end

    it 'has Array ids and sz same as range argument' do
      weighted_union.ids.size.should == 10
      weighted_union.ids[1].should == 1
      weighted_union.sz.size.should == 10
      weighted_union.sz[5].should == 1
    end
  end

  context '#connected' do
    it 'is not when first or second node are not in same component' do
      should_not be_connected(1, 5)
    end
  end

  context '#union' do
    it 'should connect smaller root point to larger one' do
      weighted_union.union(4, 3)
      weighted_union.ids[4].should == 4
      should be_connected(4, 3)
    end
  end

  it '#union multiple examples' do
    weighted_union.union(4, 3)
    weighted_union.ids[4].should == 4
    UnionHelper::print(4, 3, weighted_union.ids)

    weighted_union.union(3, 8)
    weighted_union.ids[3].should == 4
    weighted_union.ids[4].should == 4
    weighted_union.ids[8].should == 4
    UnionHelper::print(3, 8, weighted_union.ids)

    weighted_union.union(6, 5)
    weighted_union.ids[6].should == 6
    UnionHelper::print(6, 5, weighted_union.ids)

    weighted_union.union(9, 4)
    weighted_union.ids[9].should == 4
    UnionHelper::print(9, 4, weighted_union.ids)

    weighted_union.union(2, 1)
    weighted_union.ids[2].should == 2
    UnionHelper::print(2, 1, weighted_union.ids)

    should be_connected(8, 9)
    UnionHelper::print_connected(8, 9, weighted_union.connected?(8, 9))

    should_not be_connected(5, 0)
    UnionHelper::print_connected(5, 0, weighted_union.connected?(5, 0))

    weighted_union.union(5, 0)
    weighted_union.ids[5].should == 6
    UnionHelper::print(5, 0, weighted_union.ids)

    weighted_union.union(7, 2)
    weighted_union.ids[7].should == 2
    UnionHelper::print(7, 2, weighted_union.ids)

    weighted_union.union(6, 1)
    weighted_union.ids[6].should == 6
    weighted_union.ids[0].should == 6
    weighted_union.ids[5].should == 6
    UnionHelper::print(6, 1, weighted_union.ids)

    weighted_union.union(7, 3)
    weighted_union.ids[4].should == 6
    UnionHelper::print(7, 3, weighted_union.ids)

    puts ''
    puts ''
  end

  it 'Excercise 1: Question Two' do
    # 5-1 8-5 0-8 2-3 9-7 7-3 8-9 5-4 7-6
    weighted_union.union(5, 1)
    weighted_union.union(8, 5)
    weighted_union.union(0, 8)
    weighted_union.union(2, 3)
    weighted_union.union(9, 7)
    weighted_union.union(7, 3)
    weighted_union.union(8, 9)
    weighted_union.union(5, 4)
    weighted_union.union(7, 6)

    p weighted_union.ids
    puts ''
  end
end
