/// LeetCode 3069. Distribute Elements Into Two Arrays I
///
/// https://leetcode.com/problems/distribute-elements-into-two-arrays-i/

pub fn append_arr(nums : @vec.Vec[Int]) -> @vec.Vec[Int] {
  @assertion.assert_true(nums.length() >= 3).unwrap()
  let arr1: @vec.Vec[Int] = @vec.Vec::new()
  let arr2: @vec.Vec[Int] = @vec.Vec::new()
  arr1.push(nums[0])
  arr2.push(nums[1])
  for i = 2; i < nums.length(); i = i + 1 {
    if arr1[arr1.length() - 1] > arr2[arr2.length() - 1] {
      arr1.push(nums[i])
    } else {
      arr2.push(nums[i])
    }
  }
  arr1.append(arr2)
  arr1
}
