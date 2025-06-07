module MergingLists where
  mergeSortedLists list 1 list 2 = mergeLists list1 list2 []

  mergeLists [] [] acc = acc
  mergeLists [] (hd2:tl2) acc = mergeLists [] tl2 (acc++[hd2])    -- The list will actually be reverse if we don't have
  mergeLists (hd1:tl1) [] acc = mergeLists tl1 [] (acc++[hd1])    -- the last argument in brackets. Order of operation issue
  mergeLists (hd1:tl1) (hd2:tl2) acc                              -- that I can't explain
      | hd1 > hd2 = mergeLists (hd1:tl1) tl2 (acc++[hd2])
      | otherwise = mergeLists tl1 (hd2:tl2) (acc++[hd1])