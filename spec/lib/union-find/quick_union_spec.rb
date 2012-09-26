require './spec/spec_helper'
require './spec/helpers/union_helper'
require './lib/union-find/quick_union'

describe QuickUnion do
  let :quick_union do
    QuickUnion.new(9)
  end

  subject do
    quick_union
  end

  context '#initialize' do
    it 'sets ids instance variable as a Array' do
      quick_union.ids.should be_a_kind_of Array
    end

    it 'has Array ids size same as range argument' do
      quick_union.ids.size.should == 10
      quick_union.ids[8].should == 8
    end
  end

  context '#connected' do
    it 'is not when first or second node are not in same component' do
      should_not be_connected(4, 3)
    end

    it 'is when first and second node are in same component' do
     quick_union.union(4, 3)
     should be_connected(4, 3)
    end
  end

  context '#union' do
    it 'should connect two nodes from ids range' do
      quick_union.union(4, 3)
      quick_union.ids[4].should == 3
      should be_connected(4, 3)
      
      quick_union.union(3, 8)
      quick_union.ids[3].should == 8
      quick_union.ids[4].should == 3
      should be_connected(3, 8)
      should be_connected(4, 8)
    end
  end

  it '#union multiple examples' do
    quick_union.union(4, 3)
    quick_union.ids[4].should == 3
    UnionHelper::print(4, 3, quick_union.ids)

    quick_union.union(3, 8)
    quick_union.ids[3].should == 8
    quick_union.ids[4].should == 3
    UnionHelper::print(3, 8, quick_union.ids)

    quick_union.union(6, 5)
    quick_union.ids[6].should == 5
    UnionHelper::print(6, 5, quick_union.ids)

    quick_union.union(9, 4)
    quick_union.ids[9].should == 8
    UnionHelper::print(9, 4, quick_union.ids)

    quick_union.union(2, 1)
    quick_union.ids[2].should == 1
    UnionHelper::print(2, 1, quick_union.ids)

    should be_connected(8, 9)
    UnionHelper::print_connected(8, 9, quick_union.connected?(8, 9))

    should_not be_connected(5, 0)
    UnionHelper::print_connected(5, 0, quick_union.connected?(5, 0))

    quick_union.union(5, 0)
    quick_union.ids[5].should == 0
    UnionHelper::print(5, 0, quick_union.ids)

    quick_union.union(7, 2)
    quick_union.ids[7].should == 1
    UnionHelper::print(7, 2, quick_union.ids)

    quick_union.union(6, 1)
    quick_union.ids[6].should == 5
    quick_union.ids[0].should == 1
    quick_union.ids[5].should == 0
    UnionHelper::print(6, 1, quick_union.ids)

    puts ''
    puts ''
  end
end
