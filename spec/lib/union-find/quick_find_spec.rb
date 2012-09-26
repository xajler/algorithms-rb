require './spec/spec_helper'
require './spec/helpers/union_helper'
require './lib/union-find/quick_find'

describe QuickFind do
  let :quick_find do
    QuickFind.new(9)
  end

  subject do
    quick_find
  end

  context '#initialize' do
    it 'sets ids instance variable as a Array' do
      quick_find.ids.should be_a_kind_of Array
    end

    it 'has Array ids size same as range argument' do
      quick_find.ids.size.should == 10
      quick_find.ids[9].should == 9
    end
  end

  context '#connected' do
    it 'is not when first or second node are not in same component' do
      should_not be_connected(1, 5)
    end

    it 'is when first and second node are in same component' do
      quick_find.union(4, 3)
      should be_connected(4, 3)
    end
  end

  context '#union' do
    it 'should connect two nodes from ids range' do
      quick_find.union(4, 3)
      quick_find.ids[4].should == 3
      should be_connected(4, 3)
    end
  end

  it '#union multiple examples' do
    quick_find.union(4, 3)
    quick_find.ids[4].should == 3
    print(4, 3, quick_find.ids)

    quick_find.union(3, 8)
    quick_find.ids[3].should == 8
    quick_find.ids[4].should == 8
    UnionHelper::print(3, 8, quick_find.ids)

    quick_find.union(6, 5)
    quick_find.ids[6].should == 5
    UnionHelper::print(6, 5, quick_find.ids)

    quick_find.union(9, 4)
    quick_find.ids[9].should == 8
    UnionHelper::print(9, 4, quick_find.ids)

    quick_find.union(2, 1)
    quick_find.ids[2].should == 1
    UnionHelper::print(2, 1, quick_find.ids)

    should be_connected(8, 9)
    UnionHelper::print_connected(8, 9, quick_find.connected?(8, 9))

    should_not be_connected(5, 0)
    UnionHelper::print_connected(5, 0, quick_find.connected?(5, 0))

    quick_find.union(5, 0)
    quick_find.ids[5].should == 0
    UnionHelper::print(5, 0, quick_find.ids)

    quick_find.union(7, 2)
    quick_find.ids[7].should == 1
    UnionHelper::print(7, 2, quick_find.ids)

    quick_find.union(6, 1)
    quick_find.ids[6].should == 1
    quick_find.ids[0].should == 1
    quick_find.ids[5].should == 1
    UnionHelper::print(6, 1, quick_find.ids)

    puts ''
    puts ''
  end

  it 'Union-Find: Exercise 1' do
    # 8-1 5-9 2-8 4-6 7-1 4-1 
    quick_find.union(8, 1)
    quick_find.union(5, 9)
    quick_find.union(2, 8)
    quick_find.union(4, 6)
    quick_find.union(7, 1)
    quick_find.union(4, 1)
    
    p quick_find.ids
    puts ''
  end
end
